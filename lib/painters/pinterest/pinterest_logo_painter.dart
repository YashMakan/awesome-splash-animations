import 'package:flutter/material.dart';

/// Draws the Pinterest “P” inside a white circle.
/// Pulled out of `pinterest_animation.dart` for clarity.
class PinterestLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.white;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, bg);

    // ── Red “P” path (verbatim from your original) ──
    final p = Path()
      ..moveTo(size.width * .50, size.height * .0625)
      ..arcToPoint(
        Offset(size.width * .340625, size.height * .90625),
        radius: Radius.elliptical(size.width * .4375, size.height * .4375),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(size.width * .340625, size.height * .78125),
        radius: Radius.elliptical(size.width * .41375, size.height * .41375),
        clockwise: true,
      )
      ..lineTo(size.width * .3921875, size.height * .5625)
      ..arcToPoint(
        Offset(size.width * .3803125, size.height * .5),
        radius: Radius.elliptical(size.width * .1578125, size.height * .1578125),
        clockwise: true,
      )
      ..cubicTo(
        size.width * .3803125,
        size.height * .439375,
        size.width * .415625,
        size.height * .39375,
        size.width * .459375,
        size.height * .39375,
      )
      ..arcToPoint(
        Offset(size.width * .5146875, size.height * .45625),
        radius: Radius.elliptical(size.width * .055, size.height * .055),
        clockwise: true,
      )
      ..cubicTo(
        size.width * .5146875,
        size.height * .49375,
        size.width * .4909375,
        size.height * .55,
        size.width * .4784375,
        size.height * .601875,
      )
      ..arcToPoint(
        Offset(size.width * .5434375, size.height * .6809375),
        radius: Radius.elliptical(size.width * .0625, size.height * .0625),
        clockwise: false,
      )
      ..cubicTo(
        size.width * .6209375,
        size.height * .6809375,
        size.width * .6809375,
        size.height * .59875,
        size.width * .6809375,
        size.height * .480625,
      )
      ..arcToPoint(
        Offset(size.width * .498125, size.height * .3025),
        radius: Radius.elliptical(size.width * .1728125, size.height * .1728125),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(size.width * .300625, size.height * .4925),
        radius: Radius.elliptical(size.width * .189375, size.height * .189375),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(size.width * .331875, size.height * .5921875),
        radius: Radius.elliptical(size.width * .169375, size.height * .169375),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(size.width * .335, size.height * .6046875),
        radius: Radius.elliptical(size.width * .01375, size.height * .01375),
        clockwise: true,
      )
      ..cubicTo(
        size.width * .3315625,
        size.height * .6184375,
        size.width * .3240625,
        size.height * .6484375,
        size.width * .3228125,
        size.height * .654375,
      )
      ..cubicTo(
        size.width * .3215625,
        size.height * .6603125,
        size.width * .31625,
        size.height * .6640625,
        size.width * .308125,
        size.height * .6603125,
      )
      ..cubicTo(
        size.width * .2534375,
        size.height * .6346875,
        size.width * .219375,
        size.height * .555,
        size.width * .219375,
        size.height * .490625,
      )
      ..cubicTo(
        size.width * .219375,
        size.height * .3528125,
        size.width * .3196875,
        size.height * .2259375,
        size.width * .5084375,
        size.height * .2259375,
      )
      ..cubicTo(
        size.width * .66,
        size.height * .2259375,
        size.width * .778125,
        size.height * .3340625,
        size.width * .778125,
        size.height * .47875,
      )
      ..cubicTo(
        size.width * .778125,
        size.height * .629375,
        size.width * .684375,
        size.height * .750625,
        size.width * .5509375,
        size.height * .750625,
      )
      ..arcToPoint(
        Offset(size.width * .450625, size.height * .700625),
        radius: Radius.elliptical(size.width * .1175, size.height * .1175),
        clockwise: true,
      )
      ..lineTo(size.width * .4234375, size.height * .8046875)
      ..arcToPoint(
        Offset(size.width * .3690625, size.height * .919375),
        radius: Radius.elliptical(size.width * .4859375, size.height * .4859375),
        clockwise: true,
      )
      ..arcToPoint(
        Offset(size.width * .5, size.height * .9375),
        radius: Radius.elliptical(size.width * .4428125, size.height * .4428125),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(size.width * .5, size.height * .0625),
        radius: Radius.elliptical(size.width * .4375, size.height * .4375),
        clockwise: false,
      )
      ..close();

    canvas.drawPath(p, Paint()..color = const Color(0xffE60023));
  }

  @override
  bool shouldRepaint(_) => false;
}
