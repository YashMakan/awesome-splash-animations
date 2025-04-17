import 'package:five_splash_screen/painters/netflix/utils/models.dart';
import 'package:five_splash_screen/painters/netflix/utils/path_painter.dart';
import 'package:flutter/material.dart';

class NetflixAnimatedPainter extends PathPainter {
  NetflixAnimatedPainter(
      Animation<double> animation,
      List<PathSegment> pathSegments,
      Size? customDimensions,
      List<Paint> paints,
      PaintedSegmentCallback? onFinishCallback)
      : totalPathSum = 0,
        super(animation, pathSegments, customDimensions, paints,
            onFinishCallback) {
    // Sum total lengths for one-by-one sequencing.
    for (var seg in this.pathSegments!) {
      totalPathSum += seg.length;
    }
  }

  /// Total length of all segments.
  double totalPathSum;

  @override
  void paint(Canvas canvas, Size size) {
    canvas = super.paintOrDebug(canvas, size);
    if (!canPaint) return;

    // Compute the overall length that should be revealed so far.
    final double upperBound = animation.value * totalPathSum;
    double currentLength = 0.0;
    int index = 0;

    // [1] Draw fully completed segments.
    for (; index < pathSegments!.length; index++) {
      final seg = pathSegments![index];
      if (currentLength + seg.length < upperBound) {
        _drawFullSegment(canvas, seg);
        currentLength += seg.length;
      } else {
        break;
      }
    }

    // [2] For the segment that is partially revealed, calculate its fraction.
    if (index < pathSegments!.length) {
      final seg = pathSegments![index];
      final double fraction = (upperBound - currentLength) / seg.length;
      _drawPartialSegment(canvas, seg, fraction);
    }

    // [3] Optionally, notify that drawing is finished for a segment.
    super.onFinish(canvas, size, lastPainted: index);
  }

  void _drawFullSegment(Canvas canvas, PathSegment seg) {
    final paint = (paints.isNotEmpty)
        ? paints[seg.pathIndex]
        : (Paint()
          ..color = seg.color
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.square
          ..strokeWidth = seg.strokeWidth);
    canvas.drawPath(seg.path, paint);
  }

  void _drawPartialSegment(Canvas canvas, PathSegment seg, double fraction) {
    final Rect bounds = seg.path.getBounds();
    Rect clipRect;
    final AnimationDirection direction =
        seg.direction ?? AnimationDirection.leftToRight;
    switch (direction) {
      case AnimationDirection.leftToRight:
        clipRect = Rect.fromLTRB(
          bounds.left,
          bounds.top,
          bounds.left + fraction * bounds.width,
          bounds.bottom,
        );
        break;
      case AnimationDirection.rightToLeft:
        clipRect = Rect.fromLTRB(
          bounds.right - fraction * bounds.width,
          bounds.top,
          bounds.right,
          bounds.bottom,
        );
        break;
      case AnimationDirection.topToBottom:
        clipRect = Rect.fromLTRB(
          bounds.left,
          bounds.top,
          bounds.right,
          bounds.top + fraction * bounds.height,
        );
        break;
      case AnimationDirection.bottomToTop:
        clipRect = Rect.fromLTRB(
          bounds.left,
          bounds.bottom - fraction * bounds.height,
          bounds.right,
          bounds.bottom,
        );
        break;
    }
    canvas.save();
    canvas.clipRect(clipRect);
    _drawFullSegment(canvas, seg);
    canvas.restore();
  }
}
