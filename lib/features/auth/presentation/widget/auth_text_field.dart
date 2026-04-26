import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthTextField extends ConsumerStatefulWidget {
  final String label;
  final IconData prefixIcon;
  final TextEditingController controller;

  final bool isPasswordField;
  final bool hasValidator;

  final VoidCallback? onSubmitted;

  const AuthTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    required this.controller,

    this.isPasswordField = false,
    this.hasValidator = false,

    this.onSubmitted,
  });

  @override
  ConsumerState<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends ConsumerState<AuthTextField> {
  final _obscureProvider = StateProvider<bool>((ref) => true);

  @override
  Widget build(BuildContext context) {
    final isObscure = widget.isPasswordField ? ref.watch(_obscureProvider) : false;

    return TextFormField(
      controller: widget.controller,
      onFieldSubmitted: widget.onSubmitted != null ? (_) => widget.onSubmitted!() : null,
      textInputAction: widget.onSubmitted != null
          ? TextInputAction.done : TextInputAction.next,
      obscureText: isObscure,
      validator: widget.hasValidator ? (value) {
        if (value == null || value.trim().isEmpty) {
          return '이 필드는 필수 입력 항목입니다.';
        }
        return null;
      } : null,
      decoration: InputDecoration(
        labelText: widget.label,
        errorStyle: const TextStyle(color: BingColors.error),
        prefixIcon: Icon(widget.prefixIcon, size: 20),
        suffixIcon: widget.isPasswordField
            ? IconButton(
          focusNode: FocusNode(skipTraversal: true),
          icon: Icon(
            isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            size: 20,
            color: Colors.grey,
          ),
          onPressed: () {
            ref.read(_obscureProvider.notifier).state = !isObscure;
          },
        ) : null,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: BingColors.primary.withValues(alpha: 0.1), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: BingColors.primary.withValues(alpha: 0.4), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: BingColors.errorLight, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: BingColors.error, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      ),
    );
  }
}