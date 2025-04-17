import 'package:flutter/material.dart';

typedef PaintedSegmentCallback = void Function(int);

enum AnimationDirection {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}

final _directionExpando = Expando<AnimationDirection>('direction');

extension DirectionalPath on Path {
  /// Read the direction (defaults to left‑to‑right if none was set).
  AnimationDirection get direction =>
      _directionExpando[this] ?? AnimationDirection.leftToRight;

  /// Attach a direction to this particular Path object.
  set direction(AnimationDirection dir) => _directionExpando[this] = dir;
}

class ScaleFactor {
  const ScaleFactor(this.x, this.y);

  final double x;
  final double y;
}

class PathSegment {
  PathSegment()
      : strokeWidth = 0.0,
        color = Colors.black,
        firstSegmentOfPathIndex = 0,
        relativeIndex = 0,
        pathIndex = 0;

  late Path path;
  late double strokeWidth;
  late Color color;
  late double length;
  int firstSegmentOfPathIndex;
  int pathIndex;
  int relativeIndex;
  AnimationDirection? direction;
}
