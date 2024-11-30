import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird_app/constants.dart';
import 'package:flappy_bird_app/game.dart';
import 'package:flappy_bird_app/components/pipe.dart';

class PipeManager extends Component with HasGameRef<FlappyBirdGame> {
  // UPDATE -> every second (dt)

  // We will continuously spawn the pipes

  double pipeSpawnTimer = 0;

  @override
  void update(double dt) {
    // generate new pipe at given interval
    pipeSpawnTimer += dt;

    if (pipeSpawnTimer > pipeInterval) {
      pipeSpawnTimer = 0;
      spawnPipe();
    }
  }

  // SPAWN NEW PIPES
  void spawnPipe() {
    final double screenHeight = gameRef.size.y;

    // CALCULATE PIPE HEIGHTS

    // max possible height
    final double maxPipeHeight = screenHeight - groundHeight - pipeGap - minPipeHeight;

    // height of bottom pipe -> randomly select between min and max
    final double bottomPipeHeight =
        minPipeHeight + Random().nextDouble() * (maxPipeHeight - minPipeHeight);

    // height of top pipe
    final topPipeHeight = screenHeight - groundHeight - bottomPipeHeight - pipeGap;

    // CREATE BOTTOM PIPE

    final bottomPipe = Pipe(
      // position
      Vector2(gameRef.size.x, screenHeight - groundHeight - bottomPipeHeight),
      // size
      Vector2(pipeWidth, bottomPipeHeight),
      isTopPipe: false,
    );

    // CREATE TOP PIPE

    final topPipe = Pipe(
      // position
      Vector2(gameRef.size.x, 0),
      // size
      Vector2(pipeWidth, topPipeHeight),
      isTopPipe: true,
    );

    // add both pipes to the game
    gameRef.add(bottomPipe);
    gameRef.add(topPipe);
  }
}
