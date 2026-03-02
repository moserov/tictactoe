import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//theme
import 'core/theme/app_theme.dart';
//screens
import 'features/start/presentation/screens/start_screen.dart';
import 'features/game/presentation/screens/game_screen.dart';
// blocs for game logic
import 'features/game/presentation/bloc/game_bloc.dart';
import 'features/game/presentation/bloc/game_event.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/game': (context) => BlocProvider(
          create: (context) => GameBloc()..add(StartGame()),
          child: const GameScreen(),
        ),
      },
    );
  }
}
