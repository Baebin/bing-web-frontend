import 'package:bing_web_frontend/core/constants/bing_button_styles.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final _isLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
final _statusMessageProvider = StateProvider.autoDispose<String?>((ref) => null);

class BingInputDialog extends ConsumerStatefulWidget {
  final String title;
  final String content;

  final String? initialValue;
  final String hintText;

  final int? minLength;
  final int? maxLength;
  final TextInputType keyboardType;

  final Future<dynamic> Function(String) onConfirm;
  final String confirmText;
  final String secondaryText;

  const BingInputDialog({
    super.key,

    required this.title,
    required this.content,

    this.initialValue,
    this.hintText = "내용을 입력해주세요.",

    this.minLength = 0,
    this.maxLength = 255,
    this.keyboardType = TextInputType.text,

    required this.onConfirm,
    this.confirmText = "확인",
    this.secondaryText = "취소",
  });

  @override
  ConsumerState<BingInputDialog> createState() => _BingInputDialogState();
}

class _BingInputDialogState extends ConsumerState<BingInputDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleConfirm() async {
    if (ref.read(_isLoadingProvider)) return;

    final value = _controller.text.trim();
    if (value.length < (widget.minLength ?? 0)) {
      ref.read(_statusMessageProvider.notifier).state = "${widget.minLength}자 이상 입력해주세요.";
      return;
    }

    ref.read(_isLoadingProvider.notifier).state = true;
    ref.read(_statusMessageProvider.notifier).state = null;

    try {
      final result = await widget.onConfirm(value);

      if (result == true && mounted) {
        Navigator.pop(context);
      } else if (result is String) {
        ref.read(_statusMessageProvider.notifier).state = result;
      } else {
        ref.read(_statusMessageProvider.notifier).state = "알 수 없는 오류가 발생했습니다.";
      }
    } catch (e) {
      ref.read(_statusMessageProvider.notifier).state = "서버와 연결할 수 없습니다.";
    } finally {
      if (mounted) ref.read(_isLoadingProvider.notifier).state = false;
    }
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleCancel(),
      child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {},
            child: _buildDialog(),
          )
      ),
    );
  }

  Widget _buildDialog() {
    final statusMessage = ref.watch(_statusMessageProvider);

    final size = MediaQuery.sizeOf(context);
    final contentStyle = size.isMobile ? BingTextStyles.dialogBodySmall : BingTextStyles.dialogBody;

    final isLoading = ref.watch(_isLoadingProvider);

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
            Text(widget.content, style: contentStyle, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              focusNode: FocusNode()..requestFocus(),
              autofocus: true,
              keyboardType: widget.keyboardType,
              minLines: 1,
              maxLines: 5,
              maxLength: widget.maxLength,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: InputDecoration(
                hintText: widget.hintText,
                filled: true,
                fillColor: BingColors.background.withValues(alpha: 0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              ),
              onSubmitted: (_) => _handleConfirm(),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  if (statusMessage != null) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.redAccent.withValues(alpha: 0.25), width: 1.5),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline, size: 16, color: Colors.redAccent),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              statusMessage,
                              style: size.isMobile ? BingTextStyles.dialogStatusErrorSmall : BingTextStyles.dialogStatusError,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _handleCancel(),
                          style: BingButtonStyles.dangerRounded,
                          child: Text(widget.secondaryText, style: size.isMobile ? BingTextStyles.dialogButtonSmall : BingTextStyles.dialogButton),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: isLoading ? null : () => _handleConfirm(),
                          style: BingButtonStyles.primaryRounded,
                          child: Text(widget.confirmText, style: size.isMobile ? BingTextStyles.dialogButtonSmall : BingTextStyles.dialogButton),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}