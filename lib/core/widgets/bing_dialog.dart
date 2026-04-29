import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:flutter/services.dart';

class BingDialog extends StatefulWidget {
  final String title;
  final String content;

  final VoidCallback? onConfirm;
  final String confirmText;

  final bool hasSecondary;
  final VoidCallback? onSecondaryConfirm;
  final String secondaryText;

  const BingDialog({
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
  State<BingDialog> createState() => _BingDialogState();
}

class _BingDialogState extends State<BingDialog> {
  void _handleConfirm() {
    Navigator.pop(context);
    if (widget.hasSecondary) {
      widget.onSecondaryConfirm?.call();
    } else {
      widget.onConfirm?.call();
    }
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      onKeyEvent: (event) {
        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.enter ||
                event.logicalKey == LogicalKeyboardKey.numpadEnter)) {
          _handleConfirm();
        }
      },
      child: GestureDetector(
        onTap: () => _handleConfirm(),
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {},
            child: _buildDialog(),
          )
        ),
      ),
    );
  }

  Widget _buildDialog() {
    final size = MediaQuery.sizeOf(context);
    final contentStyle = size.isMobile ? BingTextStyles.dialogBodySmall : BingTextStyles.dialogBody;
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
            Text(widget.title, style: size.isMobile ? BingTextStyles.dialogTitleSmall : BingTextStyles.dialogTitle),
            const SizedBox(height: 15),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: contentStyle,
                children: _parseContent(widget.content, contentStyle),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                if (widget.hasSecondary) ...[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _handleCancel(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.withValues(alpha: 0.6),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(widget.secondaryText, style: size.isMobile ? BingTextStyles.dialogButtonSmall : BingTextStyles.dialogButton),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _handleConfirm(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BingColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(widget.confirmText, style: size.isMobile ? BingTextStyles.dialogButtonSmall : BingTextStyles.dialogButton),
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
        style: style.copyWith(fontWeight: FontWeight.bold, color: BingColors.primary),
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