import 'package:five_splash_screen/animations/netflix/utils/models.dart';
import 'package:flutter/material.dart';

List<Path> netflixSegments() {
  const letterWidth = 44.0;
  const strokeThickness = 12.0;
  const letterHeight = 85.0;
  const spacing = 8;

  // ---------------------------
  // Letter N segments
  // ---------------------------
  Path buildNLeft(double xOffset) {
    final path = Path();
    path.direction = AnimationDirection.bottomToTop;
    path.moveTo(xOffset - 1, -4);
    path.lineTo(xOffset - 1 + strokeThickness + 1, -4);
    path.lineTo(xOffset - 1 + strokeThickness + 1, -4 + letterHeight + 6.5);
    path.lineTo(xOffset - 1, -4 + letterHeight + 8.5);
    path.close();
    return path;
  }

  Path buildNDiagonal(double xOffset) {
    return Path()
      ..direction = AnimationDirection.topToBottom
      ..moveTo(xOffset - 13 + (strokeThickness * 1.0), -5)
      ..lineTo(xOffset - 14 + (strokeThickness * 2.0), -5)
      ..lineTo(xOffset + 12 + (letterWidth - strokeThickness), letterHeight - 2)
      ..lineTo(
          xOffset + 9 + (letterWidth - strokeThickness * 2.0), letterHeight)
      ..close();
  }

  Path buildNRight(double xOffset) {
    final path = Path();
    path.direction = AnimationDirection.bottomToTop;
    final startX = xOffset - 1 + (letterWidth - strokeThickness);
    const startY = -5.0;
    path.moveTo(startX, startY);
    path.lineTo(startX + strokeThickness, startY);
    path.lineTo(startX + strokeThickness, startY + letterHeight + 4);
    path.lineTo(startX, startY + letterHeight + 6);
    path.close();
    return path;
  }

  List<Path> buildNSegments(double xOffset) {
    return [
      buildNLeft(xOffset),
      buildNDiagonal(xOffset),
      buildNRight(xOffset),
    ];
  }

  // ---------------------------
  // Letter E segments
  // ---------------------------
  Path buildEVertical(double xOffset) {
    return Path()
      ..direction = AnimationDirection.bottomToTop
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(xOffset, 0, strokeThickness + 2, letterHeight - 5),
        const Radius.circular(0),
      ));
  }

  Path buildETop(double xOffset) {
    return Path()
      ..direction = AnimationDirection.leftToRight
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(
          xOffset + strokeThickness - 12,
          -5,
          letterWidth - strokeThickness + 6,
          strokeThickness + 2,
        ),
        const Radius.circular(0),
      ));
  }

  Path buildEMiddle(double xOffset) {
    return Path()
      ..direction = AnimationDirection.leftToRight
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(
          xOffset + strokeThickness,
          (letterHeight / 2) - (strokeThickness / 2) - 6,
          letterWidth - (strokeThickness * 2),
          strokeThickness + 2,
        ),
        const Radius.circular(0),
      ));
  }

  Path buildEBottom(double xOffset) {
    return Path()
      ..direction = AnimationDirection.rightToLeft
      ..moveTo(xOffset, letterHeight - strokeThickness - 5)
      ..lineTo(xOffset + letterWidth - 6, letterHeight - strokeThickness - 6.5)
      ..lineTo(xOffset + letterWidth - 6, letterHeight - strokeThickness + 7.2)
      ..lineTo(xOffset, letterHeight - strokeThickness + 9.8)
      ..close();
  }

  List<Path> buildESegments(double xOffset) {
    return [
      buildEBottom(xOffset),
      buildEVertical(xOffset),
      buildETop(xOffset),
      buildEMiddle(xOffset),
    ];
  }

  // ---------------------------
  // Letter T segments (2 parts)
  // ---------------------------
  Path buildTTop(double xOffset) {
    return Path()
      ..direction = AnimationDirection.leftToRight
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(xOffset, -5, letterWidth, strokeThickness + 2),
        const Radius.circular(0),
      ));
  }

  Path buildTVertical(double xOffset) {
    final centerX = xOffset + (letterWidth / 2) - (strokeThickness / 2);
    return Path()
      ..direction = AnimationDirection.topToBottom
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(
          centerX,
          strokeThickness - 3,
          strokeThickness + 2,
          letterHeight - strokeThickness - 3.5,
        ),
        const Radius.circular(0),
      ));
  }

  List<Path> buildTSegments(double xOffset) {
    return [
      buildTTop(xOffset),
      buildTVertical(xOffset),
    ];
  }

  // ---------------------------
  // Letter F segments
  // ---------------------------
  Path buildFVertical(double xOffset) {
    return Path()
      ..direction = AnimationDirection.topToBottom
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(xOffset, 0, strokeThickness + 1, letterHeight - 7),
        const Radius.circular(0),
      ));
  }

  Path buildFTop(double xOffset) {
    return Path()
      ..direction = AnimationDirection.leftToRight
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(
          xOffset - 12 + strokeThickness,
          -5,
          letterWidth - strokeThickness + 7,
          strokeThickness + 2,
        ),
        const Radius.circular(0),
      ));
  }

  Path buildFMiddle(double xOffset) {
    return Path()
      ..direction = AnimationDirection.leftToRight
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(
          xOffset + strokeThickness,
          (letterHeight / 2) - (strokeThickness / 2) - 7,
          letterWidth - (strokeThickness * 2),
          strokeThickness + 2,
        ),
        const Radius.circular(0),
      ));
  }

  List<Path> buildFSegments(double xOffset) {
    return [
      buildFTop(xOffset),
      buildFVertical(xOffset),
      buildFMiddle(xOffset),
    ];
  }

  // ---------------------------
  // Letter L segments
  // ---------------------------
  Path buildLVertical(double xOffset) {
    return Path()
      ..direction = AnimationDirection.topToBottom
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(xOffset, -5, strokeThickness + 1.5, letterHeight - 5),
        const Radius.circular(0),
      ));
  }

  Path buildLBottom(double xOffset) {
    return Path()
      ..direction = AnimationDirection.leftToRight
      ..moveTo(xOffset, letterHeight - strokeThickness - 8)
      ..lineTo(xOffset + letterWidth - 6, letterHeight - strokeThickness - 6.8)
      ..lineTo(xOffset + letterWidth - 6, letterHeight - strokeThickness + 7.5)
      ..lineTo(xOffset, letterHeight - strokeThickness + 5.5)
      ..close();
  }

  List<Path> buildLSegments(double xOffset) {
    return [
      buildLVertical(xOffset),
      buildLBottom(xOffset),
    ];
  }

  // ---------------------------
  // Letter I segment (only one)
  // ---------------------------
  Path buildI(double xOffset) {
    return Path()
      ..direction = AnimationDirection.bottomToTop
      ..moveTo(xOffset + (letterWidth / 2) - strokeThickness, -5)
      ..lineTo(xOffset + letterWidth / 2 + .8, -5)
      ..lineTo(xOffset + letterWidth / 2 + .8, letterHeight - 2.5)
      ..lineTo(xOffset + letterWidth / 2 - strokeThickness, letterHeight - 3.8)
      ..close();
  }

  List<Path> buildISegments(double xOffset) {
    return [
      buildI(xOffset),
    ];
  }

  // ---------------------------
  // Letter X segments (2 parts)
  // ---------------------------
  Path buildXDiagonal1(double xOffset) {
    return Path()
      ..direction = AnimationDirection.bottomToTop
      ..moveTo(xOffset - 2, -5)
      ..lineTo(xOffset + strokeThickness, -5)
      ..lineTo(xOffset + letterWidth + 2, letterHeight + 4.5)
      ..lineTo(xOffset + letterWidth - strokeThickness, letterHeight + 3)
      ..close();
  }

  Path buildXDiagonal2(double xOffset) {
    return Path()
      ..direction = AnimationDirection.topToBottom
      ..moveTo(xOffset + letterWidth + 2, -5)
      ..lineTo(xOffset + letterWidth - strokeThickness - 1, -5)
      ..lineTo(xOffset - 5, letterHeight - 1)
      ..lineTo(xOffset + strokeThickness, letterHeight)
      ..close();
  }

  List<Path> buildXSegments(double xOffset) {
    return [
      buildXDiagonal1(xOffset),
      buildXDiagonal2(xOffset),
    ];
  }

  // --------

  final segments = <Path>[];

  segments.addAll(buildNSegments(0 * (letterWidth + spacing)));
  segments.addAll(buildESegments(1.1 * (letterWidth + spacing)));
  segments.addAll(buildTSegments(2 * (letterWidth + spacing)));
  segments.addAll(buildFSegments(3 * (letterWidth + spacing) + 1));
  segments.addAll(buildLSegments(3.9 * (letterWidth + spacing) + 2));
  segments.addAll(buildISegments(5 * (letterWidth + spacing / 1.6)));
  segments.addAll(buildXSegments(6 * (letterWidth + spacing / 2.5)));

  return segments;
}
