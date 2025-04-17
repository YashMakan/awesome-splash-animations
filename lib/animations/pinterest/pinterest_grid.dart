import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '_constants.dart';

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final rnd = Random();
  late final List<int> extents =
      List<int>.generate(100, (i) => rnd.nextInt(gridMaxExtent) + 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: MasonryGridView.count(
        crossAxisCount: masonryCols,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: extents.length,
        itemBuilder: (_, i) =>
            _ImageTile(height: (extents[i] * gridTileUnit).toDouble()),
      ),
    );
  }
}

class _ImageTile extends StatelessWidget {
  const _ImageTile({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
      );
}
