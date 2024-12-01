import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../game/flappy_bird_game.dart';

class ScoreText extends TextComponent with HasGameRef<FlappyBirdGame> {
  // init
  ScoreText()
      : super(
          text: '0',
          textRenderer: TextPaint(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontFamily: 'Game',
            ),
          ),
        );

  // load
  @override
  FutureOr<void> onLoad() {
    // set the position to lower middle
    position = Vector2(
      // center horizontally
      (gameRef.size.x - size.x) / 2,
      // slightly below the top

      gameRef.size.y * 0.1,
    );
  }

  @override
  void update(double dt) {
    final newText = gameRef.score.toString();
    if (text != newText) {
      text = newText;
    }
  }
}
