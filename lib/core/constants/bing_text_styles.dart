import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:flutter/material.dart';

class BingTextStyles {
  static const headerLogo = TextStyle(
    color: BingColors.primaryDark,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const headerLogoSmall = TextStyle(
    color: BingColors.primaryDark,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  static const headerMenu = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const headerMenuSmall = TextStyle(
    color: BingColors.textSecondary,
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
    color: BingColors.primaryDark,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  static const dialogTitleSmall = TextStyle(
    color: BingColors.primaryDark,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.4,
  );
  static const dialogBody = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 15,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );
  static const dialogBodySmall = TextStyle(
    color: BingColors.textSecondary,
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

  // Profile Styles
  static const profileNickname = TextStyle(
    color: BingColors.primaryDark,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  static const profileNicknameSmall = TextStyle(
    color: BingColors.primaryDark,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.4,
  );
  static const profileBody = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.6,
  );
  static const profileBodySmall = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );
  static const profileJoinedDate = TextStyle(
    color: BingColors.primary,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );
  static const profileJoinedDateSmall = TextStyle(
    color: BingColors.primary,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
}