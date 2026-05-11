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
  static const dialogStatusError = TextStyle(
    color: Colors.redAccent,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static const dialogStatusErrorSmall = TextStyle(
    color: Colors.redAccent,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.1,
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

  // Post Detail Styles
  static const postDetailCategory = TextStyle(
    color: BingColors.primary,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );
  static const postDetailCategorySmall = TextStyle(
    color: BingColors.primary,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );

  static const postDetailTitle = TextStyle(
    color: BingColors.primaryDark,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.2,
    letterSpacing: -0.5,
  );
  static const postDetailTitleSmall = TextStyle(
    color: BingColors.primaryDark,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    height: 1.2,
    letterSpacing: -0.4,
  );

  static const postDetailAuthor = TextStyle(
    color: BingColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const postDetailAuthorSmall = TextStyle(
    color: BingColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const postDetailMeta = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 15,
  );
  static const postDetailMetaSmall = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 13,
  );
  
  // Editor Styles
  static const editorTitle = TextStyle(
    color: BingColors.primaryDark,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  static const editorTitleSmall = TextStyle(
    color: BingColors.primaryDark,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.4,
  );

  static const editorHint = TextStyle(
    color: Colors.grey,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  static const editorHintSmall = TextStyle(
    color: Colors.grey,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.4,
  );

  static const editorBody = TextStyle(
    color: BingColors.textPrimary,
    fontSize: 16,
    height: 1.6,
  );

  // Post List Styles
  static const postListMainTitle = TextStyle(
    color: BingColors.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  static const postListMainTitleSmall = TextStyle(
    color: BingColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const postListHeader = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const postListItemTitleSmall = TextStyle(
    color: BingColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const postListItemTitle = TextStyle(
    color: BingColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const postListHeaderSmall = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const postListItemMeta = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const postListItemMetaSmall = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static const postPagingNumber = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  // Comment Styles
  static const commentAuthor = TextStyle(
    color: BingColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const commentAuthorSmall = TextStyle(
    color: BingColors.textPrimary,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static const commentBody = TextStyle(
    color: BingColors.textPrimary,
    fontSize: 14,
    height: 1.4,
  );
  static const commentBodySmall = TextStyle(
    color: BingColors.textPrimary,
    fontSize: 12,
    height: 1.3,
  );

  static const commentMeta = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 13,
  );
  static const commentMetaSmall = TextStyle(
    color: BingColors.textSecondary,
    fontSize: 11,
  );

  static const commentButtonLabel = TextStyle(
    color: Colors.black87,
    fontSize: 11,
    height: 1.0,
  );

  static const commentButtonLabelSmall = TextStyle(
    color: Colors.black87,
    fontSize: 10,
    height: 1.0,
  );

  static const commentInputHint = TextStyle(
    color: Colors.grey,
    fontSize: 13,
  );
  static const commentInputHintSmall = TextStyle(
    color: Colors.grey,
    fontSize: 12,
  );

  static const commentInputTool = TextStyle(
    color: Colors.grey,
    fontSize: 12,
  );
  static const commentInputToolSmall = TextStyle(
    color: Colors.grey,
    fontSize: 11,
  );

  static const commentSubmit = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  static const commentSubmitSmall = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
}