import 'package:flame/game.dart';
import 'package:flappy_bird_app/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'game/flappy_bird_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final flappyBirdGame = FlappyBirdGame();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameWidget(
        initialActiveOverlays: const [mainMenuId],
        overlayBuilderMap: {
          mainMenuId: (context, _) => MainMenuScreen(
                game: flappyBirdGame,
              )
        },
        game: flappyBirdGame,
      ),
    );
  }
}
