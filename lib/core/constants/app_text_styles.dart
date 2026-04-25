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

  // Dialog Styles
  static const dialogTitle = TextStyle(
    color: AppColors.primaryDark,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  static const dialogTitleSmall = TextStyle(
    color: AppColors.primaryDark,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.4,
  );
  static const dialogBody = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 15,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );
  static const dialogBodySmall = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );
  static const dialogButton = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const dialogButtonSmall = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const dialogButtonSecondary = TextStyle(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const dialogButtonSecondarySmall = TextStyle(
    color: Colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}