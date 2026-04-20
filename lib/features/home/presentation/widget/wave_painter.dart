import 'dart:math';

import 'package:bing_web_frontend/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double value;

  const WavePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.6)
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height);

    for (double i = 0; i <= size.width; i++) {
      double y = sin((i / size.width * 2 * pi) + value * 2 * pi) * 20 +
          size.height / 2;
      path.lineTo(i, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}