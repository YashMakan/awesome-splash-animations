import 'package:five_splash_screen/painters/netflix/utils/models.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;

abstract class PathPainter extends CustomPainter {
  PathPainter(this.animation, this.pathSegments, this.customDimensions,
      this.paints, this.onFinishCallback)
      : canPaint = false,
        super(repaint: animation) {
    calculateBoundingBox();
  }

  Rect? pathBoundingBox;

  double? strokeWidth;

  Size? customDimensions;
  final Animation<double> animation;

  List<PathSegment>? pathSegments;

  List<Paint> paints;

  bool canPaint;

  PaintedSegmentCallback? onFinishCallback;

  late ui.PictureRecorder recorder;

  void calculateBoundingBox() {
    var bb = pathSegments!.first.path.getBounds();
    var strokeWidth = 0;

    for (var e in pathSegments!) {
      bb = bb.expandToInclude(e.path.getBounds());
      if (strokeWidth < e.strokeWidth) {
        strokeWidth = e.strokeWidth.toInt();
      }
    }

    if (paints.isNotEmpty) {
      for (var e in paints) {
        if (strokeWidth < e.strokeWidth) {
          strokeWidth = e.strokeWidth.toInt();
        }
      }
    }
    pathBoundingBox = bb.inflate(strokeWidth / 2);
    this.strokeWidth = strokeWidth.toDouble();
  }

  void onFinish(Canvas canvas, Size size, {int lastPainted = -1}) {
    onFinishCallback!(lastPainted);
  }

  Canvas paintOrDebug(Canvas canvas, Size size) {
    paintPrepare(canvas, size);
    return canvas;
  }

  void paintPrepare(Canvas canvas, Size size) {
    canPaint = animation.status == AnimationStatus.forward ||
        animation.status == AnimationStatus.completed;

    if (canPaint) viewBoxToCanvas(canvas, size);
  }

  ScaleFactor calculateScaleFactor(Size viewBox) {
    var dx = (viewBox.width) / pathBoundingBox!.width;
    var dy = (viewBox.height) / pathBoundingBox!.height;

    late double ddx, ddy;

    assert(!(dx == 0 && dy == 0));

    if (!viewBox.isEmpty) {
      if (customDimensions != null) {
        ddx = dx;
        ddy = dy;
      } else {
        ddx = ddy = min(dx, dy);
      }
    } else if (dx == 0) {
      ddx = ddy = dy;
    } else if (dy == 0) {
      ddx = ddy = dx;
    }
    return ScaleFactor(ddx, ddy);
  }

  void viewBoxToCanvas(Canvas canvas, Size size) {
    var viewBox =
    (customDimensions != null) ? customDimensions : Size.copy(size);
    var scale = calculateScaleFactor(viewBox!);
    canvas.scale(scale.x, scale.y);

    var offset = Offset.zero - pathBoundingBox!.topLeft;
    canvas.translate(offset.dx, offset.dy);

    var center = Offset((size.width / scale.x - pathBoundingBox!.width) / 2,
        (size.height / scale.y - pathBoundingBox!.height) / 2);
    canvas.translate(center.dx, center.dy);

    var clipRect = pathBoundingBox;
    canvas.clipRect(clipRect!);
  }

  @override
  bool shouldRepaint(PathPainter old) => true;
}