import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:flutter/material.dart';

class BingBoxDecorations {
  static final BoxDecoration commonBoard = BoxDecoration(
    color: Colors.white.withValues(alpha: 0.9),
    borderRadius: BorderRadius.circular(30),
    border: Border.all(
      color: BingColors.primary.withValues(alpha: 0.2),
      width: 1.5,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.05),
        blurRadius: 20,
        spreadRadius: 5,
      ),
    ],
  );
}