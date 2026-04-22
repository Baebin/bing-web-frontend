import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class HoverButton extends ConsumerStatefulWidget {
  final String title;
  final TextStyle style;
  final VoidCallback onTap;

  const HoverButton({
    super.key,
    required this.title,
    required this.style,
    required this.onTap,
  });

  @override
  ConsumerState<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends ConsumerState<HoverButton> {
  final hoverProvider = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context) {
   final bool isHovered = ref.watch(hoverProvider);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => ref.read(hoverProvider.notifier).update((state) => true),
      onExit: (_) => ref.read(hoverProvider.notifier).update((state) => false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          style: widget.style.copyWith(
            color: isHovered ? Colors.lightBlue : widget.style.color,
            shadows: isHovered
                ? [Shadow(color: Colors.lightBlue.withValues(alpha: 0.3), blurRadius: 8)]
                : [],
          ),
          child: Text(widget.title),
        ),
      ),
    );
  }
}