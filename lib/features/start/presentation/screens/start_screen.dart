import 'package:flutter/material.dart';
import 'package:tictactoe/core/widgets/custom_app_bar.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/game'),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text('Play Game', style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
