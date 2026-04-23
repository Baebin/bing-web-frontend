import 'package:bing_web_frontend/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const headerLogo = TextStyle(
    color: AppColors.primaryDark,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const headerLogoSmall = TextStyle(
    color: AppColors.primaryDark,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  static const headerMenu = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const headerMenuSmall = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
  );

  // Button Styles
  static const buttonLabel = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );
  static const buttonLabelSmall = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}