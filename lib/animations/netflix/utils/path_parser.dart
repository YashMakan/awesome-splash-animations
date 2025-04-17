import 'package:five_splash_screen/animations/netflix/utils/models.dart';
import 'package:flutter/material.dart';

class PathParser {
  final List<PathSegment> _pathSegments = <PathSegment>[];

  void addPathSegments(
      Path path, int index, double? strokeWidth, Color? color) {
    var firstPathSegmentIndex = _pathSegments.length;
    var relativeIndex = 0;
    path.computeMetrics().forEach((metric) {
      var segment = PathSegment()
        ..path = metric.extractPath(0, metric.length)
        ..length = metric.length
        ..firstSegmentOfPathIndex = firstPathSegmentIndex
        ..pathIndex = index
        ..relativeIndex = relativeIndex
        ..direction = path.direction;
      if (color != null) segment.color = color;
      if (strokeWidth != null) segment.strokeWidth = strokeWidth;

      _pathSegments.add(segment);
      relativeIndex++;
    });
  }

  List<PathSegment> loadFromPaths(List<Path> paths) {
    _pathSegments.clear();

    var index = 0;
    for (var p in paths) {
      addPathSegments(p, index, null, null);
      index++;
    }

    return _pathSegments;
  }
}
