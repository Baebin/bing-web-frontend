import 'package:bing_web_frontend/core/constants/app_colors.dart';
import 'package:bing_web_frontend/core/constants/app_images.dart';
import 'package:bing_web_frontend/core/constants/app_text_styles.dart';
import 'package:bing_web_frontend/core/router/app_route.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/core/widgets/hover_button.dart';
import 'package:bing_web_frontend/core/widgets/line_divider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          final isMobile = width < 600;
          final isDesktop = width > 1024;
          final isTablet = !isMobile && !isDesktop;

          return Container(
            height: preferredSize.height,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.primary.withValues(alpha: 0.3),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        child: Row(
                          children: [
                            CachedImage(
                                url: AppImages.logo.path,
                                width: isMobile ? 40 : 60,
                                height: isMobile ? 40 : 60,
                                isCircle: true
                            ),

                            SizedBox(width: 30),
                            const Text("빙구의 빈 공간", style: AppTextStyles.headerLogo),

                            const Spacer(),

                            SizedBox(width: 50),
                            HoverButton(
                                title: "Login",
                                style: AppTextStyles.headerMenu,
                                onTap: () => context.push(AppRoute.login)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                LineDivider(isVertical: false, width: double.infinity, height: 0, color: AppColors.primaryLight),
                SizedBox(height: 20),
                _buildMenuSection(isMobile),
                SizedBox(height: 20),

                LineDivider(isVertical: false, width: double.infinity, height: 0.0, color: AppColors.primaryLight),
              ],
            ),
          );
        }
    );
  }

  Widget _buildMenuSection(bool isMobile) {
    double spacing = isMobile ? 15.0 : 30.0;
    return Row(
      spacing: spacing,
      mainAxisSize: MainAxisSize.min,
      children: [
        HoverButton(
            title: "Portfolio",
            style: AppTextStyles.headerMenu,
            onTap: () {}),
        LineDivider(isVertical: true, width: 1.0, height: 15.0, color: AppColors.primary),
        HoverButton(
            title: "Blog",
            style: AppTextStyles.headerMenu,
            onTap: () {}),
        LineDivider(isVertical: true, width: 1.0, height: 15.0, color: AppColors.primary),
        HoverButton(
            title: "Community",
            style: AppTextStyles.headerMenu,
            onTap: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}