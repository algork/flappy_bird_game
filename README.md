# flappy_bird_game

This is a Flappy Bird game built in Flutter using the Flame engine.

## Getting Started

Follow these instructions to get the game running locally.

### Installation
1. Clone the repository:

   `git clone git@github.com:algork/flappy_bird_game.git`

   `cd flappy-bird-clone`
2. `flutter pub get`
3. `flutter run`

## How It Works
The game uses a combination of Flutter and Flame for smooth 2D gameplay:

1. Gravity and Velocity: Physics-based movement is applied to the bird.
2. Pipe Spawning: Pipes are generated at intervals, with randomized heights and a fixed gap.
3. Collision Detection: CollisionCallbacks from Flame detect interactions between the bird and pipes.
4. Game Loop: Flame's update method handles frame-by-frame updates.

## Acknowledgments
Inspired by the original Flappy Bird game.

Built with ❤️ using Flutter and Flame.

Thanks to the open-source community for tools and tutorials!