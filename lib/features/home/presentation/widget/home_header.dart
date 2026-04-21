import 'package:bing_web_frontend/core/constants/app_colors.dart';
import 'package:bing_web_frontend/core/constants/app_images.dart';
import 'package:bing_web_frontend/core/constants/app_text_styles.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/core/widgets/hover_button.dart';
import 'package:bing_web_frontend/core/widgets/line_divider.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
                  constraints: BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Row(
                      children: [
                        CachedImage(url: AppImages.logo.path, width: 60, height: 60, isCircle: true),

                        SizedBox(width: 30),
                        const Text("빙구의 빈 공간", style: AppTextStyles.headerLogo),

                        const Spacer(),

                        SizedBox(width: 50),
                        HoverButton(
                            title: "Login",
                            style: AppTextStyles.headerMenu,
                            onTap: () => {}),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            LineDivider(isVertical: false, width: double.infinity, height: 0, color: AppColors.primaryLight),
            SizedBox(height: 20),
            Row(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoverButton(
                    title: "Portfolio",
                    style: AppTextStyles.headerMenu,
                    onTap: () => {}),
                LineDivider(isVertical: true, width: 20.0, height: 20.0, color: AppColors.primary),
                HoverButton(
                    title: "Blog",
                    style: AppTextStyles.headerMenu,
                    onTap: () => {}),
                LineDivider(isVertical: true, width: 20.0, height: 20.0, color: AppColors.primary),
                HoverButton(
                    title: "Community",
                    style: AppTextStyles.headerMenu,
                    onTap: () => {}),
              ],
            ),
            SizedBox(height: 20),
            LineDivider(isVertical: false, width: double.infinity, height: 0.0, color: AppColors.primaryLight),
          ],
        ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}