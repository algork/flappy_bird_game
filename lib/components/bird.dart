import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird_app/game/flappy_bird_game.dart';
import 'package:flappy_bird_app/components/pipe.dart';

import '../constants.dart';
import '../game/assets.dart';
import 'ground.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
  /// INIT BIRD

  // Initiate bird position and size
  Bird()
      : super(
          position: Vector2(birdStartX, birdStartY),
          size: Vector2(birdWidth, birdHeight),
        );

  // Physical world properties
  double velocity = 0;

  // LOAD

  @override
  FutureOr<void> onLoad() async {
    // load bird sprite
    sprite = await Sprite.load(Assets.bird2);

    // add hit box
    add(RectangleHitbox());
  }

  // JUMP

  void jump() {
    velocity = jumpStrength;
  }

  // UPDATE -> every second

  @override
  void update(double dt) {
    // apply gravity
    velocity += gravity * dt;

    //update bird's position based on current velocity
    position.y += velocity * dt;

    if (position.y < 1) {
      (parent as FlappyBirdGame).gameOver();
    }
  }

  // COLLISION -> with another object
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Ground) {
      (parent as FlappyBirdGame).gameOver();
    }

    if (other is Pipe) {
      (parent as FlappyBirdGame).gameOver();
    }
  }
}
