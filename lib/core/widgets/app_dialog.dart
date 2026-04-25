import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:bing_web_frontend/core/constants/app_colors.dart';
import 'package:bing_web_frontend/core/constants/app_text_styles.dart';
import 'package:flutter/services.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String content;

  final VoidCallback? onConfirm;
  final String confirmText;

  final bool hasSecondary;
  final VoidCallback? onSecondaryConfirm;
  final String secondaryText;

  const AppDialog({
    super.key,
    required this.title,
    required this.content,

    this.onConfirm,
    this.confirmText = "확인",

    this.hasSecondary = false,
    this.onSecondaryConfirm,
    this.secondaryText = "취소",
  });

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      onKeyEvent: (event) {
        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.enter ||
                event.logicalKey == LogicalKeyboardKey.numpadEnter)) {
          Navigator.pop(context);
          if (hasSecondary) {
            onSecondaryConfirm?.call();
          } else {
            onConfirm?.call();
          }
        }
      },
      child: _buildDialog(context),
    );
  }

  Widget _buildDialog(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        padding: const EdgeInsets.all(25),
        constraints: BoxConstraints(maxWidth: size.isMobile ? size.width * 0.85 : 400),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: size.isMobile ? AppTextStyles.dialogTitleSmall : AppTextStyles.dialogTitle),
            const SizedBox(height: 15),
            Text(
                content,
                textAlign: TextAlign.center,
                style: size.isMobile ? AppTextStyles.dialogBodySmall : AppTextStyles.dialogBody
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                if (hasSecondary) ...[
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onSecondaryConfirm?.call();
                      },
                      child: Text(secondaryText, style: size.isMobile ? AppTextStyles.dialogButtonSecondarySmall : AppTextStyles.dialogButtonSecondary),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm?.call();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(confirmText, style: size.isMobile ? AppTextStyles.dialogButtonSmall : AppTextStyles.dialogButton),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}