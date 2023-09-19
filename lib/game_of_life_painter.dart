import 'package:flutter/material.dart';

class GameOfLifePainter extends CustomPainter {
  GameOfLifePainter(this.grid);

  final List<List<bool>> grid;

  @override
  void paint(Canvas canvas, Size size) => _drawGrid(size, canvas);

  void _drawGrid(Size size, Canvas canvas) {
    for (int i = 0; i < grid.length; i++) {
      final List<bool> row = grid[i];

      for (int j = 0; j < row.length; j++) {
        final bool alive = row[j];
        final Color color = alive ? Colors.orange : Colors.black;

        final Paint paint = Paint()..color = color;

        final Rect rect = Rect.fromLTWH(
          j * size.width / row.length,
          i * size.height / grid.length,
          size.width / row.length,
          size.height / grid.length,
        );

        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(4)),
          paint..maskFilter = MaskFilter.blur(BlurStyle.solid, 8),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
