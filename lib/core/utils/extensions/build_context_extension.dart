import 'package:bing_web_frontend/core/widgets/bing_dialog.dart';
import 'package:bing_web_frontend/core/widgets/bing_input_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtension on BuildContext {
  String get currentLocation => GoRouterState.of(this).uri.toString();
  String get currentPath => GoRouterState.of(this).uri.path;

  Map<String, String> get queryParameters => GoRouterState.of(this).uri.queryParameters;

  String? queryParam(String key) => queryParameters[key];

  String _buildLocation(String location, Map<String, dynamic>? queryParameters) {
    if (queryParameters == null || queryParameters.isEmpty) return location;
    return Uri(path: location, queryParameters: queryParameters).toString();
  }

  // 현재 페이지 파괴 (기존 데이터 소멸)
  void goSafe(String location, { Map<String, dynamic>? queryParameters }) {
    final target = _buildLocation(location, queryParameters);
    if (currentLocation != target) go(target);
  }

  // 현재 페이지 유지 (기존 데이터 유지)
  void pushSafe(String location, {Map<String, dynamic>? queryParameters}) {
    final target = _buildLocation(location, queryParameters);
    if (currentLocation != target) push(target);
  }

  // 현재 페이지 교체 (기존 데이터 소멸)
  void replaceSafe(String location, {Map<String, dynamic>? queryParameters}) {
    final target = _buildLocation(location, queryParameters);
    if (currentLocation != target) replace(target);
  }

  void _showAnimatedAlert(Widget dialog) {
    showGeneralDialog(
      context: this,
      barrierDismissible: true,
      barrierLabel: "",
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, anim1, anim2) {
        return dialog;
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


  void showAlert({
    required String title,
    required String content,

    VoidCallback? onConfirm,
    String confirmText = "확인",

    bool hasSecondary = false,
    VoidCallback? onSecondaryConfirm,
    String secondaryText = "취소",
  }) {
    _showAnimatedAlert(
        BingDialog(
          title: title,
          content: content,
          onConfirm: onConfirm,
          confirmText: confirmText,
          hasSecondary: hasSecondary,
          onSecondaryConfirm: onSecondaryConfirm,
          secondaryText: secondaryText,
        )
    );
  }

  void showInputDialog({
    required String title,
    required String content,

    required Future<dynamic> Function(String) onConfirm,

    String? initialValue,
    String hintText = "내용을 입력해주세요.",

    int? minLength,
    int? maxLength,
    TextInputType keyboardType = TextInputType.text,

    String confirmText = "확인",
    String secondaryText = "취소",
  }) {
    _showAnimatedAlert(
        BingInputDialog(
          title: title,
          content: content,
          onConfirm: onConfirm,
          initialValue: initialValue,
          hintText: hintText,
          minLength: minLength,
          maxLength: maxLength,
          keyboardType: keyboardType,
          confirmText: confirmText,
          secondaryText: secondaryText,
        )
    );
  }
}