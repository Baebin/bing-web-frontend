import 'package:bing_web_frontend/core/constants/app_colors.dart';
import 'package:bing_web_frontend/features/home/presentation/widget/home_animation_widget.dart';
import 'package:flutter/material.dart';

class HomeAnimationSection extends StatefulWidget {
  final bool hasText;

  const HomeAnimationSection({
    super.key,
    this.hasText = false,
  });

  @override
  State<HomeAnimationSection> createState() => _HomeAnimationSectionState();

}

class _HomeAnimationSectionState extends State<HomeAnimationSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryLight,
            AppColors.primary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: HomeAnimationWidget(hasText: widget.hasText),
    );
  }
}