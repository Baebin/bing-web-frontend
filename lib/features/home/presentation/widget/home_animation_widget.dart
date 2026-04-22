import 'dart:math';
import 'package:bing_web_frontend/core/constants/app_colors.dart';
import 'package:bing_web_frontend/core/constants/app_images.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:flutter/material.dart';


class HomeAnimationWidget extends StatefulWidget {
  final bool hasText;

  const HomeAnimationWidget({
    super.key,
    required this.hasText
  });

  @override
  State<HomeAnimationWidget> createState() => _HomeAnimationWidgetState();
}

class _HomeAnimationWidgetState extends State<HomeAnimationWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _getSineValue(double speed, double amplitude) {
    return sin(_controller.value * 2 * pi * speed) * amplitude;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        final isMobile = width < 600;
        final isDesktop = width > 1024;
        final isTablet = !isMobile && !isDesktop;

        return RepaintBoundary(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                children: [
                  // Sands
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: height * 0.22,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.sandDark,
                            AppColors.sandMain,
                          ],
                        ),
                        // 입체감을 위한 상단 경계 그림자
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            offset: const Offset(0, -2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Sun
                  Positioned(
                    top: height * 0.13,
                    left: width * 0.18,
                    child: Opacity(
                      opacity: 0.6,
                      child: Container(
                        width: isMobile ? 60 : 100,
                        height: isMobile ? 60 : 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Large Cloud
                  Positioned(
                    top: height * 0.1,
                    right: width * 0.05 + _getSineValue(0.2, 20),
                    width: isMobile ? width * 0.3 : 200,
                    child: CachedImage(url: AppImages.cloudLarge.path),
                  ),
                  if (isDesktop)
                    Positioned(
                      top: height * 0.05,
                      left: width * 0.4 + _getSineValue(0.3, 25),
                      width: 180,
                      child: CachedImage(url: AppImages.cloudLarge.path),
                    ),

                  // Medium Cloud
                  if (isTablet || isDesktop)
                    Positioned(
                      top: height * 0.15,
                      left: width * 0.1 + _getSineValue(0.4, 15),
                      width: 150,
                      child: CachedImage(url: AppImages.cloudMedium.path),
                    ),
                  if (isDesktop)
                    Positioned(
                      top: height * 0.2,
                      right: width * 0.3 + _getSineValue(0.1, 15),
                      width: 100,
                      child: Opacity(
                        opacity: 0.5,
                        child: CachedImage(url: AppImages.cloudMedium.path),
                      ),
                    ),

                  // Seagulls
                  Positioned(
                      top: height * 0.2 + _getSineValue(1.0, 5),
                      left: width * (isMobile ? 0.1 : 0.3) + _getSineValue(0.5, 40),
                      width: isMobile ? 70 : 100,
                      child: CachedImage(url: AppImages.seagulls.path)
                  ),

                  // Beach Items
                  Positioned(
                    bottom: 45,
                    left: width * 0.2 + _getSineValue(0.2, 2),
                    width: isMobile ? 30 : 45,
                    child: CachedImage(url: AppImages.beachItemOne.path),
                  ),
                  Positioned(
                    bottom: 20,
                    left: width * 0.45 + _getSineValue(0.3, 3),
                    width: isMobile ? 35 : 50,
                    child: CachedImage(url: AppImages.beachItemTwo.path),
                  ),
                  Positioned(
                    bottom: 60,
                    right: width * 0.35 + _getSineValue(0.25, 2),
                    width: isMobile ? 30 : 45,
                    child: CachedImage(url: AppImages.beachItemThree.path),
                  ),
                  Positioned(
                    bottom: 25,
                    right: width * 0.15 + _getSineValue(0.4, 3),
                    width: isMobile ? 40 : 55,
                    child: CachedImage(url: AppImages.beachItemFour.path),
                  ),

                  // Palm Tree
                  Positioned(
                    bottom: 0,
                    right: isMobile ? -50 : -20,
                    height: isMobile ? height * 0.35 : height * 0.5,
                    child: CachedImage(url: AppImages.palmTrees.path),
                  ),

                  // Flowers
                  Positioned(
                      bottom: -10,
                      left: -10,
                      width: height * 0.3,
                      child: CachedImage(url: AppImages.flowers.path)
                  ),

                  if (widget.hasText)
                    child!,
                ],
              );
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to BingGu Blog',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 24 : 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "BingGu Web Blog",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
