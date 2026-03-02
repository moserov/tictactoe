import 'package:flutter/material.dart';
import 'package:tictactoe/core/widgets/custom_app_bar.dart';
import '../widgets/game_view.dart';


class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Game Started'),
      body: GameView(), // Hier lagern wir die BLoC-Logik aus
    );
  }
}