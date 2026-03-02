import 'package:equatable/equatable.dart';

abstract class GameState extends Equatable {
  const GameState();
  @override
  List<Object?> get props => [];
}

class GameInitial extends GameState {
  const GameInitial();
}

class GameInProgress extends GameState {
  final List<String> board;
  final String currentPlayer;

  const GameInProgress({required this.board, required this.currentPlayer}); 

  @override
  List<Object?> get props => [board, currentPlayer];
}

class GameOver extends GameState {
  final String? winner;
  final List<String> board; 

  const GameOver({this.winner, required this.board});

  @override
  List<Object?> get props => [winner, board];
}
