import 'dart:ui';

import 'package:flutter/material.dart';
import '_constants.dart';

/// Base class every glyph painter extends.
abstract class _LetterPainter extends CustomPainter {
  _LetterPainter({
    required this.opacity,
    required this.progress,
  }) : super(repaint: Listenable.merge([opacity, progress]));

  final Animation<double> opacity;
  final Animation<double> progress;

  Path buildLetterPath();
  Path buildMaskPath();

  Path? _letter;
  List<PathMetric>? _maskMetrics;

  @override
  void paint(Canvas canvas, Size size) {
    _letter       ??= buildLetterPath();
    _maskMetrics  ??= buildMaskPath().computeMetrics().toList();

    // 1. white fill
    canvas.drawPath(
      _letter!,
      Paint()
        ..style = PaintingStyle.fill
        ..color  = foregroundColor.withOpacity(opacity.value),
    );

    // 2. black “eraser” stroke that reveals the shape
    if (progress.value == 0) return;
    for (final m in _maskMetrics!) {
      final p = m.extractPath(0, m.length * progress.value);
      canvas.drawPath(
        p,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8.5
          ..color = backgroundColor,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _LetterPainter old) =>
      opacity != old.opacity || progress != old.progress;
}

// ────────────────────────────────────────────────────────────────────────
//  U
// ────────────────────────────────────────────────────────────────────────
class ULetterPainter extends _LetterPainter {
  ULetterPainter({required super.opacity, required super.progress});

  @override
  Path buildLetterPath() => Path()
    ..moveTo(20.924, 46.871)
    ..cubicTo(28.25, 46.871, 33.914, 41.182, 33.914, 32.764)
    ..lineTo(33.914, 0)
    ..lineTo(41.844, 0)
    ..lineTo(41.844, 53.09)
    ..lineTo(33.99, 53.09)
    ..lineTo(33.99, 48.16)
    ..cubicTo(30.44, 51.876, 25.532, 54, 20.017, 54)
    ..cubicTo(8.687, 54, 0, 45.733, 0, 33.224)
    ..lineTo(0, 0.01)
    ..lineTo(7.93, 0.01)
    ..lineTo(7.93, 32.765)
    ..cubicTo(7.93, 41.335, 13.519, 46.872, 20.922, 46.872)
    ..close();

  @override
  Path buildMaskPath() => Path()
    ..moveTo(3.99927, 0)
    ..cubicTo(3.99927, 0, 3.99927, 23.8866, 3.99927, 32.9433)
    ..cubicTo(3.99927, 42, 9.49855, 50.5, 20.9993, 50.5)
    ..cubicTo(30, 50.5, 36, 43.5, 37.9993, 31.9433);
}

// ────────────────────────────────────────────────────────────────────────
//  B
// ────────────────────────────────────────────────────────────────────────
class BLetterPainter extends _LetterPainter {
  BLetterPainter({required super.opacity, required super.progress});

  @override
  Path buildLetterPath() => Path()
    ..moveTo(0.011, 0)
    ..lineTo(7.64, 0)
    ..lineTo(7.64, 19.34)
    ..arcToPoint(const Offset(13.894, 15.067),
        radius: const Radius.elliptical(19, 19))
    ..arcToPoint(const Offset(21.311, 13.575),
        radius: const Radius.elliptical(19, 19))
    ..cubicTo(32.641, 13.575, 41.553, 22.6, 41.553, 33.825)
    ..cubicTo(41.553, 44.975, 32.641, 53.998, 21.31, 53.998)
    ..arcToPoint(const Offset(13.855, 52.51),
        radius: const Radius.elliptical(19.2, 19.2))
    ..arcToPoint(const Offset(7.558, 48.235),
        radius: const Radius.elliptical(19.2, 19.2))
    ..lineTo(7.558, 53.087)
    ..lineTo(0, 53.087)
    ..close()
    ..moveTo(20.783, 47.25)
    ..cubicTo(28.035, 47.25, 34.002, 41.257, 34.002, 33.825)
    ..cubicTo(34.002, 26.316, 28.035, 20.401, 20.782, 20.401)
    ..cubicTo(13.455, 20.401, 7.488, 26.316, 7.488, 33.825)
    ..cubicTo(7.488, 41.257, 13.38, 47.25, 20.783, 47.25)
    ..close();

  @override
  Path buildMaskPath() => Path()
    ..moveTo(4.00187, 34.1016)
    ..cubicTo(3.86175, 24.7138, 11.613, 17.1016, 21.0019, 17.1016)
    ..cubicTo(30.3907, 17.1016, 38.142, 24.7138, 38.0019, 34.1016)
    ..cubicTo(37.8638, 43.3523, 30.2537, 50.6016, 21.0019, 50.6016)
    ..cubicTo(11.7501, 50.6016, 4.13994, 43.3523, 4.00187, 34.1016)
    ..close();
}

// ────────────────────────────────────────────────────────────────────────
//  E
// ────────────────────────────────────────────────────────────────────────
class ELetterPainter extends _LetterPainter {
  ELetterPainter({required super.opacity, required super.progress});

  @override
  Path buildLetterPath() => Path()
    ..moveTo(19.79, 14)
    ..cubicTo(30.892, 14, 39.05, 22.57, 39.05, 34.099)
    ..lineTo(39.05, 36.602)
    ..lineTo(7.708, 36.602)
    ..cubicTo(8.766, 42.896, 13.977, 47.599, 20.469, 47.599)
    ..cubicTo(24.929, 47.599, 28.704, 45.778, 31.573, 41.909)
    ..lineTo(34.331, 43.958)
    ..lineTo(37.088, 46.005)
    ..cubicTo(33.235, 51.163, 27.494, 54.272, 20.469, 54.272)
    ..cubicTo(8.913, 54.272, 0, 45.626, 0, 34.099)
    ..cubicTo(0, 23.177, 8.535, 14, 19.79, 14)
    ..moveTo(7.855, 30.534)
    ..lineTo(31.346, 30.534)
    ..cubicTo(30.063, 24.618, 25.304, 20.674, 19.639, 20.674)
    ..cubicTo(13.975, 20.674, 9.216, 24.618, 7.855, 30.534)
    ..close();

  @override
  Path buildMaskPath() => Path()
    ..moveTo(8.22021, 33.5)
    ..lineTo(35.5, 33.5)
    ..cubicTo(35.5, 33.5, 35.5, 17.5024, 19.7897, 17.5)
    ..cubicTo(8.8433, 17.4984, 4.0745, 25.1525, 4.00059, 34.0986)
    ..cubicTo(3.92445, 43.3141, 11.2546, 50.9031, 20.4699, 51)
    ..cubicTo(29, 51.0849, 34.5, 43.5, 34.5, 43.5);
}

// ────────────────────────────────────────────────────────────────────────
//  R
// ────────────────────────────────────────────────────────────────────────
class RLetterPainter extends _LetterPainter {
  RLetterPainter({required super.opacity, required super.progress});

  @override
  Path buildLetterPath() => Path()
    ..moveTo(16.24, 21.235)
    ..cubicTo(11.255, 21.235, 7.629, 25.103, 7.629, 31.095)
    ..lineTo(7.629, 53.089)
    ..lineTo(0, 53.089)
    ..lineTo(0, 14.409)
    ..lineTo(7.558, 14.409)
    ..lineTo(7.558, 19.191)
    ..cubicTo(9.446, 16.081, 12.544, 14.109, 16.773, 14.109)
    ..lineTo(19.416, 14.109)
    ..lineTo(19.416, 21.239)
    ..close();

  @override
  Path buildMaskPath() => Path()
    ..moveTo(3.81006, 14.1094)
    ..lineTo(3.81006, 53.4094)
    ..moveTo(19.8, 17.6252)
    ..cubicTo(13.7, 17.6094, 5.3999, 18.6108, 3.8999, 30.6096);
}
