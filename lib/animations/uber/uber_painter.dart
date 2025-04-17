import 'dart:math' as math;

import 'package:flutter/material.dart';

import '_constants.dart';
import 'uber_letters.dart';

/// Single painter that draws the Uber intro.
class UberSplashPainter extends CustomPainter {
  UberSplashPainter(AnimationController c)
      : // ── Background anims ──────────────────────────────────────────────
        _bgProgress = Tween<double>(begin: 0, end: 1)
            .chain(
              CurveTween(
                curve: const Interval(bgProgressStart / animationDuration,
                    bgProgressEnd / animationDuration,
                    curve: Cubic(.26, .05, .78, .61)),
              ),
            )
            .animate(c),
        _bgOpacity = Tween<double>(begin: 1, end: 0)
            .chain(
              CurveTween(
                curve: const Interval(bgOpacityStart / animationDuration,
                    bgOpacityEnd / animationDuration,
                    curve: Cubic(.26, .05, .78, .61)),
              ),
            )
            .animate(c),
        // ── Foreground anims ──────────────────────────────────────────────
        _fgOpacity = TweenSequence([
          TweenSequenceItem(
              tween: Tween(begin: .515, end: 0.0), weight: 18 / 75),
          TweenSequenceItem(tween: ConstantTween(0.0), weight: 3 / 75),
          TweenSequenceItem(tween: ConstantTween(1.0), weight: 54 / 75),
        ]).animate(c),
        _fgProgress = Tween<double>(begin: 0, end: 1)
            .chain(
              CurveTween(
                curve: const Interval(fgProgressStart / animationDuration,
                    fgProgressEnd / animationDuration,
                    curve: Cubic(.72, 0, .59, .52)),
              ),
            )
            .animate(c),
        _offset = Tween<double>(begin: 0, end: 1)
            .chain(
              CurveTween(
                curve: const Interval(fgOffsetStart / animationDuration,
                    fgOffsetEnd / animationDuration,
                    curve: Curves.easeIn),
              ),
            )
            .animate(c),
        _linesLength = Tween<double>(begin: 0, end: 1)
            .chain(
              CurveTween(
                curve: const Interval(fgLinesLenStart / animationDuration,
                    fgLinesLenEnd / animationDuration,
                    curve: Curves.easeInOut),
              ),
            )
            .animate(c),
        _linesGap = Tween<double>(begin: 0, end: 1)
            .chain(
              CurveTween(
                curve: const Interval(fgLinesGapStart / animationDuration,
                    fgLinesGapEnd / animationDuration,
                    curve: Cubic(.77, -0.1, .66, .73)),
              ),
            )
            .animate(c),
        super(repaint: c) {
    _u = ULetterPainter(opacity: _fgOpacity, progress: _fgProgress);
    _b = BLetterPainter(opacity: _fgOpacity, progress: _fgProgress);
    _e = ELetterPainter(opacity: _fgOpacity, progress: _fgProgress);
    _r = RLetterPainter(opacity: _fgOpacity, progress: _fgProgress);
  }

  // Animations
  final Animation<double> _bgProgress;
  final Animation<double> _bgOpacity;
  final Animation<double> _fgOpacity;
  final Animation<double> _fgProgress;
  final Animation<double> _offset;
  final Animation<double> _linesLength;
  final Animation<double> _linesGap;

  // Letter painters
  late final ULetterPainter _u;
  late final BLetterPainter _b;
  late final ELetterPainter _e;
  late final RLetterPainter _r;

  // ──────────────────────────────────────────────────────────────────────
  @override
  void paint(Canvas canvas, Size size) {
    _paintBackground(canvas, size);
    _paintForeground(canvas, size);
  }

  void _paintBackground(Canvas canvas, Size size) {
    if (_bgOpacity.value == 0) return;

    final screen = Offset.zero & size;
    final fadingW = (0.23 + 0.77 * _bgProgress.value) * screen.width;
    final fading = Rect.fromCenter(
      center: screen.center,
      width: fadingW,
      height: screen.height,
    );
    final p = Paint()..color = backgroundColor.withOpacity(_bgOpacity.value);
    canvas.drawRect(fading, p);

    // Opaque side bars
    if (_bgProgress.value < 1) {
      p.color = backgroundColor;
      canvas
        ..drawRect(
            Rect.fromLTRB(
                screen.left, screen.top, fading.left + .5, screen.bottom),
            p)
        ..drawRect(
            Rect.fromLTRB(
                fading.right - .5, screen.top, screen.right, screen.bottom),
            p);
    }
  }

  void _paintForeground(Canvas canvas, Size size) {
    if (_fgProgress.value == 1) return;

    // Layout identical to original delegate
    const logoSize = Size(155, 54);
    const maxOffset = 32.7;
    const ubGap = 5.88;
    const uSize = Size(41.84, 54);
    const bSize = Size(41.55, 54);
    const eSize = Size(39.05, 54);
    const rSize = Size(19.42, 54);

    final screen = Offset.zero & size;
    final base =
        screen.center - Offset(logoSize.width / 2, logoSize.height / 2);

    var uRect = base & uSize;
    if (_offset.value > 0) {
      uRect = uRect.translate(maxOffset * _offset.value, 0);
    }
    final bRect = uRect.topRight.translate(ubGap, 0) & bSize;
    final eRect = bRect.topRight.translate(3.02, 0) & eSize;
    final rRect = eRect.topRight.translate(4.23, 0) & rSize;

    // Letters
    canvas
      ..save()
      ..translate(uRect.left, uRect.top)
      ..clipRect(Offset.zero & uSize);
    _u.paint(canvas, uSize);
    canvas.restore();
    canvas
      ..save()
      ..translate(bRect.left, bRect.top)
      ..clipRect(Offset.zero & bSize);
    _b.paint(canvas, bSize);
    canvas.restore();
    canvas
      ..save()
      ..translate(eRect.left, eRect.top)
      ..clipRect(Offset.zero & eSize);
    _e.paint(canvas, eSize);
    canvas.restore();
    canvas
      ..save()
      ..translate(rRect.left, rRect.top)
      ..clipRect(Offset.zero & rSize);
    _r.paint(canvas, rSize);
    canvas.restore();

    // Lines between U | | B
    if (_linesLength.value == 0 || _linesGap.value == 1) return;

    const initialLine = Size(8.5, 54);
    const maxLineW = 50.0;
    final maxLineH = screen.height;

    final gap = math.max(0, (screen.width - ubGap) * _linesGap.value);
    final sizeLn = Size(
      initialLine.width + (maxLineW - initialLine.width) * _linesGap.value,
      initialLine.height + (maxLineH - initialLine.height) * _linesLength.value,
    );

    final left = uRect.centerRight
            .translate(-sizeLn.width - gap / 2, -sizeLn.height / 2) &
        sizeLn;
    final paint = Paint()..color = foregroundColor;
    canvas
      ..drawRect(left, paint)
      ..drawRect(left.topRight.translate(ubGap + gap, 0) & sizeLn, paint);
  }

  @override
  bool shouldRepaint(covariant UberSplashPainter old) => true;
}
