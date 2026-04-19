import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class HoverButton extends ConsumerStatefulWidget {
  final String title;
  final double fontSize;
  final VoidCallback onTap;

  const HoverButton({
    super.key,
    required this.title,
    required this.fontSize,
    required this.onTap,
  });

  @override
  ConsumerState<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends ConsumerState<HoverButton> {
  bool isHovered = true;

  final hoverProvider = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context) {
    bool isHovered = ref.watch(hoverProvider);
    return MouseRegion(
      onEnter: (_) => ref.read(hoverProvider.notifier).update((state) => true),
      onExit: (_) => ref.read(hoverProvider.notifier).update((state) => false),
      child: GestureDetector(
        onTap: () => widget.onTap,
        child: Text(widget.title, style: TextStyle(fontSize: widget.fontSize, color: (isHovered ? Colors.cyan : Colors.black))),
      ),
    );
  }
}