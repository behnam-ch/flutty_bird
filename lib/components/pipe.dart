import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../game/assets.dart';
import '../game/configuration.dart';
import '../game/flutty_bird_game.dart';
import '../game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FluttyBirdGame> {
  Pipe({required this.height, required this.pipePosition});

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    final Image pipe;
    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        pipe = await Flame.images.load(Assets.pipRoated);
        position.y = 0;
        break;
      case PipePosition.bottom:
        pipe = await Flame.images.load(Assets.pipe);
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        break;
    }

    sprite = Sprite(pipe);

    add(RectangleHitbox());
  }
}
