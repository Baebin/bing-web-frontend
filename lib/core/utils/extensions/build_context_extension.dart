import 'package:bing_web_frontend/core/widgets/biing_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtension on BuildContext {
  void pushSafe(String location) {
    final String currentLocation = GoRouterState.of(this).uri.toString();
    if (currentLocation != location) push(location);
  }

  void showAlert({
    required String title,
    required String content,

    VoidCallback? onConfirm,
    String confirmText = "확인",

    bool hasSecondary = false,
    VoidCallback? onSecondaryConfirm,
    String secondaryText = "취소",
  }) {
    showGeneralDialog(
      context: this,
      barrierDismissible: true,
      barrierLabel: "",
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, anim1, anim2) {
        return BingDialog(
          title: title,
          content: content,
          onConfirm: onConfirm,
          confirmText: confirmText,
          hasSecondary: hasSecondary,
          onSecondaryConfirm: onSecondaryConfirm,
          secondaryText: secondaryText,
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        final isClosing = anim1.status == AnimationStatus.reverse;

        final curve = isClosing
            ? Curves.easeIn.transform(anim1.value)
            : Curves.easeOutBack.transform(anim1.value);

        return Transform.scale(
          scale: isClosing ? 0.9 + (anim1.value * 0.1) : curve,
          child: Opacity(
            opacity: anim1.value,
            child: child,
          ),
        );
      },
    );
  }
}