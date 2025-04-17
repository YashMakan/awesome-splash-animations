import 'package:flutter/material.dart';

/// Re‑usable white triangle.  Pulled out so it can be golden‑tested.
class PlayTriangle extends StatelessWidget {
  const PlayTriangle({super.key, this.size = 14});
  final double size;

  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: Size.square(size), painter: _TrianglePainter());
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas c, Size s) {
    final p = Path()
      ..moveTo(0, 0)
      ..lineTo(s.width, s.height / 2)
      ..lineTo(0, s.height)
      ..close();
    c.drawPath(p, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_) => false;
}
