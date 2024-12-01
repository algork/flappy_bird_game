import 'package:flappy_bird_app/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

import '../components/tap_sign_widget.dart';
import '../constants.dart';
import '../game/assets.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappyBirdGame game;

  const MainMenuScreen({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return GestureDetector(
      onTap: () {
        game.overlays.remove(mainMenuId);
        game.resumeEngine();
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Transform.scale(
                scale: 0.3,
                child: Image.asset(Assets.birdMenu),
              ),
              Transform.scale(
                scale: 2.3,
                child: Image.asset(Assets.getReady),
              ),
              const SizedBox(
                height: 50,
              ),
              Transform.scale(
                scale: 1.5,
                child: Image.asset(Assets.flappyBird),
              ),
              const SizedBox(
                height: 50,
              ),
              const TapSignBlink(),
            ],
          ),
        ),
      ),
    );
  }
}
