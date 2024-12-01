import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../constants.dart';
import '../game/assets.dart';
import '../game/flappy_bird_game.dart';

class Ground extends SpriteComponent with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  // init ground sprite
  Ground() : super();

  // LOAD

  @override
  FutureOr<void> onLoad() async {
    // set size and position
    size = Vector2(2 * gameRef.size.x, groundHeight);
    position = Vector2(0, gameRef.size.y - groundHeight);

    // load ground sprite image
    sprite = await Sprite.load(Assets.ground);

    // add hit box
    add(RectangleHitbox());
  }

  // UPDATE -> every second
  @override
  void update(double dt) {
    // move ground to left
    position.x -= groundScrollSpeed * dt;

    // reset ground if it goes off screen for infinite loop
    // if half of ground has been passed, reset.
    if (position.x + size.x / 2 <= 0) {
      position.x = 0;
    }
  }
}
