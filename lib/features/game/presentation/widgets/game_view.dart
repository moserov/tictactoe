import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/features/game/presentation/bloc/game_bloc.dart';
import 'package:tictactoe/features/game/presentation/bloc/game_event.dart';
import 'package:tictactoe/features/game/presentation/bloc/game_state.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        final board = (state is GameInProgress)
            ? state.board
            : (state as GameOver).board;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatusText(state),
            const SizedBox(height: 20),
            _buildGrid(context, state, board),
            const SizedBox(height: 40),
            _buildRestartButton(context),
          ],
        );
      },
    );
  }

  Widget _buildStatusText(GameState state) {
    if (state is GameInProgress) {
      return Text(
        'Current Player: ${state.currentPlayer}',
        style: const TextStyle(fontSize: 20),
      );
    } else if (state is GameOver) {
      if (state.winner != null) {
        return Text(
          'Winner: ${state.winner}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        );
      } else {
        return const Text(
          'It is a Draw!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        );
      }
    }
    return const SizedBox.shrink();
  }

  Widget _buildGrid(BuildContext context, GameState state, List<String> board) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          final cellValue = board[index];
          final canMove = state is GameInProgress && cellValue.isEmpty;
          final isGameOver = state is GameOver;

          return GestureDetector(
            onTap: canMove
                ? () => context.read<GameBloc>().add(MakeMove(index))
                : null,
            child: Container(
              decoration: BoxDecoration(
                color: canMove
                    ? colorScheme.primary.withValues(alpha: 0.5)
                    : isGameOver
                    ? colorScheme.surfaceContainerHighest
                    : colorScheme.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  cellValue,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.surface,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRestartButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => context.read<GameBloc>().add(ResetGame()),
      icon: const Icon(Icons.refresh),
      label: const Text('Restart Game'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
    );
  }
}
