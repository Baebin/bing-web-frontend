import 'package:flutter/material.dart';

class LineDivider extends StatelessWidget {
  final bool isVertical;
  final double width;
  final double height;
  final double thickness;
  final Color color;

  const LineDivider({
    super.key,
    required this.isVertical,
    required this.width,
    required this.height,
    this.thickness = 1.5,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return SizedBox(
        height: height,
        child: VerticalDivider(
          width: width,
          thickness: thickness,
          color: color,
        ),
      );
    }
    return SizedBox(
      width: width,
      child: Divider(
        height: height,
        thickness: thickness,
        color: color,
      ),
    );
  }
}