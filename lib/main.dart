import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game/flutty_bird_game.dart';
import 'screens/game_over_screen.dart';
import 'screens/main_menu_screen.dart';

void main() {
  final game = FluttyBirdGame();

  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        MainMenuScreen.id: (contex, _) => MainMenuScreen(game: game),
        GameOverScreen.id: (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}
