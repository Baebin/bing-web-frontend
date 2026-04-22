import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class LoginTextField extends ConsumerStatefulWidget {
  final String label;
  final IconData prefixIcon;
  final bool isPasswordField;

  const LoginTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.isPasswordField = false,
  });

  @override
  ConsumerState<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends ConsumerState<LoginTextField> {
  final _obscureProvider = StateProvider<bool>((ref) => true);

  @override
  Widget build(BuildContext context) {
    final isObscure = widget.isPasswordField ? ref.watch(_obscureProvider) : false;

    return TextFormField(
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(widget.prefixIcon, size: 20),
        suffixIcon: widget.isPasswordField
            ? IconButton(
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
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      ),
    );
  }
}