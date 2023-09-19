import 'package:flutter/material.dart';

import 'package:flutter_game_of_life/game_of_life.dart';
import 'package:flutter_game_of_life/game_of_life_painter.dart';

const Size size = Size(400, 400);

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: StreamBuilder<List<List<bool>>>(
              stream: GameOfLife(50)(),
              initialData: const <List<bool>>[],
              builder: (
                BuildContext context,
                AsyncSnapshot<List<List<bool>>> snapshot,
              ) =>
                  CustomPaint(
                size: size,
                painter: GameOfLifePainter(snapshot.data!),
              ),
            ),
          ),
        ),
      );
}
