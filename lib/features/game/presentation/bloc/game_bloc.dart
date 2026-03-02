import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';
import '../../domain/tic_tac_toe_logic.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameInitial()) {
    on<StartGame>(_onResetGame);
    on<ResetGame>(_onResetGame);
    on<MakeMove>(_onMakeMove);
    
  }

  void _onResetGame(GameEvent event, Emitter<GameState> emit) {
    //logic for starting/resetting game
    emit(GameInProgress(
      board: List.filled(9, ''),
      currentPlayer: 'X',
    ));
  }

  void _onMakeMove(MakeMove event, Emitter<GameState> emit) {
    final currentState = state;
    if (currentState is GameInProgress) {
      //ignore click when field not empty
      if (currentState.board[event.index].isNotEmpty) return;
      // create new Board with the move
      final newBoard = List<String>.from(currentState.board);
      // add move to new board
      newBoard[event.index] = currentState.currentPlayer;


      // Ask game engine if winner or draw
      final winner = GameEngine.checkWinner(newBoard);
      final isDraw = GameEngine.isDraw(newBoard);

      if (winner != null) {
        //someone won
        emit(GameOver(winner: winner, board: newBoard));
      } else if (isDraw) {
        //draw
        emit(GameOver(winner: null, board: newBoard));
      } else {
        // continue game with next player
        final nextPlayer = currentState.currentPlayer == 'X' ? 'O' : 'X';
        emit(GameInProgress(board: newBoard, currentPlayer: nextPlayer));
      }
    }
  }

  
}