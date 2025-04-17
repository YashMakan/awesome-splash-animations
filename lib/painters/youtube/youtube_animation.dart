import 'dart:ui';
import 'package:flutter/material.dart';

import '_constants.dart';
import 'youtube_logo.dart';
import 'youtube_logo_painter.dart';
import 'youtube_progress_bar.dart';

class YouTubeAnimation extends StatefulWidget {
  const YouTubeAnimation({super.key});
  @override State<YouTubeAnimation> createState() => _YouTubeAnimationState();
}

class _YouTubeAnimationState extends State<YouTubeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  /// helper for `Interval`s
  Interval _i(int from, int to) => Interval(itv(from, 0), itv(to, 0));

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this,
        duration: Duration(milliseconds: s(tAllDone)))..forward();
  }

  @override
  Widget build(BuildContext context) {
    // ───────── phase animations ─────────
    final arrowOut     = Tween(begin: 0.0, end: arrowDxEnd)
        .animate(CurvedAnimation(parent: _c, curve: _i(tPinchStart, tPinchEnd)));
    final arrowOpacity = CurvedAnimation(parent: _c, curve: _i(tPinchStart, tTrackFade));
    final trackOpacity = CurvedAnimation(parent: _c, curve: _i(tTrackFade, tPinchEnd + 20));
    final fill         = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _c, curve: _i(tPinchEnd, tFillEnd)));

    // collapse (arrow back + bar shrink + arrow scale)
    final collapse   = CurvedAnimation(parent: _c, curve: _i(tFillEnd, tCollapseEnd));
    final arrowBack  = Tween(begin: arrowDxEnd, end: 0.0).animate(collapse);
    final arrowScale = Tween(begin: 1.0, end: 0.0).animate(collapse);
    final barShrink  = Tween(begin: 1.0, end: 0.0).animate(collapse);

    return Scaffold(
      backgroundColor: const Color(0xFF1e1c21),
      body: AnimatedBuilder(
        animation: _c,
        builder: (_, __) {
          final ms = _c.value * s(tAllDone);

          // red capsule pinches 0–630ms
          double sx = 1, sy = 1, logoOpacity = 1;
          if (ms >= s(tPinchStart) && ms <= s(tPinchEnd)) {
            final t = (ms - s(tPinchStart)) / (s(tPinchEnd) - s(tPinchStart));
            sx = lerpDouble(1.0, pinchX, t)!;
            sy = lerpDouble(1.0, pinchY, t)!;
          } else if (ms > s(tPinchEnd)) {
            logoOpacity = 0;
          }
          final logoHasTriangle = ms < s(tPinchStart);

          return Center(
            child: Stack(alignment: Alignment.center, children: [
              // grey track + red fill, then shrink
              Opacity(
                opacity: trackOpacity.value,
                child: YoutubeProgressBar(fill: fill.value, shrinkScale: barShrink.value),
              ),

              // play arrow
              Opacity(
                opacity: arrowOpacity.value,
                child: Transform.translate(
                  offset: Offset(ms < s(tFillEnd) ? arrowOut.value : arrowBack.value, 0),
                  child: Transform.scale(
                    scale: ms < s(tFillEnd) ? 1.0 : arrowScale.value,
                    child: const PlayTriangle(size: arrowSize),
                  ),
                ),
              ),

              // original red capsule morph
              Opacity(
                opacity: logoOpacity,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.diagonal3Values(sx, sy, 1),
                  child: YoutubeLogo(width: logoWidth, showTriangle: logoHasTriangle),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }
}
