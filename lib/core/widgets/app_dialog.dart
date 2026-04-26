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
    final size = MediaQuery.sizeOf(context);
    final contentStyle = size.isMobile ? AppTextStyles.dialogBodySmall : AppTextStyles.dialogBody;
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
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: contentStyle,
                children: _parseContent(content, contentStyle),
              ),
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

  List<InlineSpan> _parseContent(String text, TextStyle style) {
    final List<InlineSpan> spans = [];
    final RegExp regExp = RegExp(r'\*\*(.*?)\*\*');

    int lastIndex = 0;
    for (final Match match in regExp.allMatches(text)) {
      // 패턴 이전의 일반 텍스트
      if (match.start > lastIndex) {
        spans.add(TextSpan(text: text.substring(lastIndex, match.start)));
      }
      // ** 사이의 강조 텍스트
      spans.add(TextSpan(
        text: match.group(1),
        style: style.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),
      ));
      lastIndex = match.end;
    }
    // 남은 일반 텍스트
    if (lastIndex < text.length) {
      spans.add(TextSpan(text: text.substring(lastIndex), style: style));
    }
    return spans;
  }
}