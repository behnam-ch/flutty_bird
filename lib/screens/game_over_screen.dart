import 'package:flutter/material.dart';

import '../game/assets.dart';
import '../game/flutty_bird_game.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key, required this.game});

  final FluttyBirdGame game;
  static const String id = 'gameOver';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score: ${game.bird.score}',
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text(
                'Restart',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove(GameOverScreen.id);
    game.resumeEngine();
  }
}
