import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird_app/constants.dart';
import 'package:flappy_bird_app/game/flappy_bird_game.dart';

import '../game/assets.dart';

class Pipe extends SpriteComponent with CollisionCallbacks, HasGameRef<FlappyBirdGame> {
  // determine if the pip is top or bottom
  final bool isTopPipe;

  // score
  bool scored = false;

  // init
  Pipe(Vector2 position, Vector2 size, {required this.isTopPipe})
      : super(position: position, size: size);

  // LOAD

  @override
  FutureOr<void> onLoad() async {
    // load pipe sprite
    sprite = await Sprite.load(isTopPipe ? Assets.pipeTop : Assets.pipeBottom);

    // add hit box
    add(RectangleHitbox());
  }

  // UPDATE

  @override
  void update(double dt) {
    // scroll pipe to left
    position.x -= groundScrollSpeed * dt;

    // check if the bird has passed this pipe
    if (!scored && position.x + size.x < gameRef.bird.position.x) {
      scored = true;

      // only increment for top pipes to avoid double scoring
      if (isTopPipe) {
        gameRef.incrementScore();
      }
    }

    //remove pipe if it goes off the screen
    if (position.x + size.x <= 0) {
      removeFromParent();
    }
  }
}
