import 'package:flutter/material.dart';

import '_constants.dart';

/// Grey track with red fill that shrinks during collapse.
class YoutubeProgressBar extends StatelessWidget {
  const YoutubeProgressBar({
    super.key,
    required this.fill,        // 0‑1 red overlay
    required this.shrinkScale, // 1‑0 bar width
  });

  final double fill;
  final double shrinkScale;

  @override
  Widget build(BuildContext context) {
    final barW = barWidth * shrinkScale; // shrink from right
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: arrowSize + spacing), // arrow lane
        Container(
          width: barW,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
            borderRadius: BorderRadius.circular(2),
          ),
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: fill, // red fill 0‑1
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFf52645), Color(0xFFfd2f92)],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
