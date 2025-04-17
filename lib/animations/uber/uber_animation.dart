import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '_constants.dart';
import 'uber_painter.dart';

class UberAnimation extends StatefulWidget {
  const UberAnimation({super.key});

  @override
  State<UberAnimation> createState() => _UberAnimationState();
}

class _UberAnimationState extends State<UberAnimation>
    with SingleTickerProviderStateMixin {
  final _splashVisible = ValueNotifier(true);
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: animationDuration),
  );

  @override
  void initState() {
    super.initState();
    _controller.addStatusListener(
          (s) => _splashVisible.value = s != AnimationStatus.completed,
    );

    // Let the launch logo breathe for a beat
    Future<void>.delayed(const Duration(milliseconds: 800), _controller.forward);
  }

  @override
  void dispose() {
    _splashVisible.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          // your app’s red backdrop
          Container(color: Colors.white, width: double.infinity, height: double.infinity),
          // splash painter
          ValueListenableBuilder(
            valueListenable: _splashVisible,
            builder: (_, show, __) =>
            show ? CustomPaint(painter: UberSplashPainter(_controller),
                size: Size.infinite)
                : const SizedBox.shrink(),
          ),
        ],
      ),
    ),
  );
}
