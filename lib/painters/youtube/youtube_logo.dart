import 'package:flutter/material.dart';

import '_constants.dart';

/// Red YouTube capsule. `showTriangle=false` lets us mask the arrow mid‑animation.
class YoutubeLogo extends StatelessWidget {
  const YoutubeLogo({
    super.key,
    this.width = logoWidth,
    this.showTriangle = true,
  });

  final double width;
  final bool   showTriangle;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
    child: AspectRatio(
      aspectRatio: 16 / 11,
      child: CustomPaint(painter: _LogoPainter(showTriangle)),
    ),
  );
}

class _LogoPainter extends CustomPainter {
  const _LogoPainter(this.showTriangle);
  final bool showTriangle;

  @override
  void paint(Canvas canvas, Size s) {
    final r = RRect.fromRectAndRadius(
      Offset.zero & s, Radius.circular(s.shortestSide * .28),
    );
    canvas.drawRRect(r, Paint()..color = const Color(0xFFfb2632));

    if (showTriangle) {
      final p = Path()
        ..moveTo(s.width * .40, s.height * .28)
        ..lineTo(s.width * .72, s.height * .50)
        ..lineTo(s.width * .40, s.height * .72)
        ..close();
      canvas.drawPath(p, Paint()..color = Colors.white);
    }
  }

  @override
  bool shouldRepaint(covariant _LogoPainter old) =>
      old.showTriangle != showTriangle;
}
