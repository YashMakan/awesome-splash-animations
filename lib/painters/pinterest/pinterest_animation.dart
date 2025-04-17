import 'package:flutter/material.dart';

import '_constants.dart';
import 'pinterest_grid.dart';
import 'pinterest_logo_painter.dart';

/// Splash that mimics Pinterest’s Android intro.
class PinterestAnimation extends StatefulWidget {
  const PinterestAnimation({super.key});

  @override
  State<PinterestAnimation> createState() => _PinterestAnimationState();
}

class _PinterestAnimationState extends State<PinterestAnimation>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: splashDurationMs),
  );

  // ── PHASE ANIMATIONS ──
  late final Animation<double> _scale;

  late final Animation<double> _coverOpacity;
  late final Animation<Offset> _logoSlideUp;
  late final Animation<Offset> _listSlideUp;

  @override
  void initState() {
    super.initState();

    // 0‑.33: grow; .33‑.66: shrink; .66‑1: overshoot back
    _scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.4).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.4, end: .8).chain(CurveTween(curve: Curves.easeIn)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: .8, end: 1.0).chain(CurveTween(curve: Curves.elasticOut)),
        weight: 1,
      ),
    ]).animate(_controller);

    _coverOpacity = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.33, 1, curve: Curves.easeOut),
      ),
    );

    _logoSlideUp = Tween(begin: Offset.zero, end: const Offset(0, -1.2)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.66, 1, curve: Curves.easeInOut),
      ),
    );

    _listSlideUp = Tween(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.66, 1, curve: Curves.easeInOut),
      ),
    );

    Future.delayed(const Duration(seconds: 2), _controller.forward);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => Stack(
        fit: StackFit.expand,
        children: [
          // 1. List (starts hidden under white cover)
          SlideTransition(position: _listSlideUp, child: const PinterestGrid()),

          // 2. White cover that fades away
          IgnorePointer(
            child: Opacity(
              opacity: _coverOpacity.value,
              child: Container(color: Colors.white),
            ),
          ),

          // 3. Logo
          SlideTransition(
            position: _logoSlideUp,
            child: Center(
              child: Transform.scale(
                scale: _scale.value,
                child: SizedBox.square(
                  dimension: logoSide,
                  child: CustomPaint(painter: PinterestLogoPainter()),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
