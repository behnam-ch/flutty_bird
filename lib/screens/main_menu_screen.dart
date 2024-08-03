import 'package:flutter/material.dart';

import '../game/assets.dart';
import '../game/flutty_bird_game.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key, required this.game});

  final FluttyBirdGame game;
  static const String id = 'mainMenu';

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove(id);
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}
