import 'package:five_splash_screen/animations/netflix/netflix_painter.dart';
import 'package:five_splash_screen/animations/netflix/utils/path_parser.dart';
import 'package:flutter/material.dart';

import 'segments.dart';

class NetflixAnimation extends StatefulWidget {
  const NetflixAnimation({Key? key}) : super(key: key);

  @override
  State<NetflixAnimation> createState() => _NetflixAnimationState();
}

class _NetflixAnimationState extends State<NetflixAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late List<Path> segments;

  @override
  void initState() {
    super.initState();
    segments = netflixSegments();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _controller.forward();

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() => _alignment = Alignment.center);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Alignment _alignment = const Alignment(0.5, 0.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedAlign(
          alignment: _alignment,
          duration: const Duration(milliseconds: 2500),
          curve: Curves.easeInOutCubic,
          child: CustomPaint(
            painter: NetflixAnimatedPainter(
                _controller,
                PathParser().loadFromPaths(segments),
                Size(MediaQuery.of(context).size.width * .7, 85),
                List.generate(segments.length,
                        (index) => Paint()..color = const Color(0xFFe42114))
                    .toList(),
                (_) {}),
          ),
        ),
      ],
    );
  }
}
