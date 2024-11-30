import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_app/components/background.dart';
import 'package:flappy_bird_app/components/pipe.dart';
import 'package:flappy_bird_app/components/pipe_manager.dart';
import 'package:flappy_bird_app/components/score.dart';
import 'package:flappy_bird_app/constants.dart';
import 'package:flutter/material.dart';

import 'components/bird.dart';
import 'components/ground.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late Background background;
  late Ground ground;
  late PipeManager pipeManager;
  late ScoreText scoreText;

  // LOAD

  @override
  FutureOr<void> onLoad() async {
    // load background
    background = Background(size);
    add(background);

    // load bird
    bird = Bird();
    add(bird);

    // load ground
    ground = Ground();
    add(ground);

    // load pipes
    pipeManager = PipeManager();
    add(pipeManager);

    // load score
    scoreText = ScoreText();
    add(scoreText);
  }

  // TAP

  @override
  void onTap() {
    bird.jump();
  }

  // SCORE

  int score = 0;

  void incrementScore() {
    score += 1;
  }

  // GAVE OVER

  bool isGameOver = false;

  void gameOver() {
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine();

    // show game over dialog
    showDialog(
      barrierDismissible: false,
      context: buildContext!,
      builder: (context) => AlertDialog(
        title: const Text('Game Over'),
        content: Text('Your Score: $score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              resetGame();
            },
            child: const Text('Restart'),
          )
        ],
      ),
    );
  }

  // RESTART the game

  void resetGame() {
    bird.position = Vector2(birdStartX, birdHeight);
    bird.velocity = 0;
    score = 0;
    isGameOver = false;
    // Remove all pipes from the game
    children.whereType<Pipe>().forEach(
          (Pipe pipe) => pipe.removeFromParent(),
        );
    resumeEngine();
  }
}
