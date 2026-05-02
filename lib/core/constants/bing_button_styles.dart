import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:flutter/material.dart';

class BingButtonStyles {
  static final ButtonStyle primaryRounded = ElevatedButton.styleFrom(
    backgroundColor: BingColors.primary,
    foregroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.symmetric(vertical: 15),
  );

  static final ButtonStyle dangerRounded = ElevatedButton.styleFrom(
    backgroundColor: Colors.red.withValues(alpha: 0.6),
    foregroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.symmetric(vertical: 15),
  );

  static final ButtonStyle pastelRounded = ElevatedButton.styleFrom(
    backgroundColor: BingColors.pastelBlueSoft,
    foregroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.symmetric(vertical: 15),
  );
}