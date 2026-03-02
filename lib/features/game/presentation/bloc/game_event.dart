import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartGame extends GameEvent {}

class ResetGame extends GameEvent {}

class MakeMove extends GameEvent {
  final int index; 
  MakeMove(this.index);
  
  @override
  List<Object?> get props => [index];
}
