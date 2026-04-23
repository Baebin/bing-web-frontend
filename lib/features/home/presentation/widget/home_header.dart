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
          final isMobile = width < 600;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                color: AppColors.primary.withValues(alpha: 0.3),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 10 : 15,
                          horizontal: isMobile ? 15 : 30
                      ),
                      child: Row(
                        children: [
                          CachedImage(
                            url: AppImages.logo.path,
                            width: isMobile ? 40 : 65,
                            height: isMobile ? 40 : 65,
                            isCircle: true,
                            hasSolidBorder: true,
                            borderColor: AppColors.primary,
                            borderWidth: isMobile ? 2.0 : 3.0,
                          ),
                          const SizedBox(width: 20),
                          Flexible(
                            child: Text("빙구의 빈 공간", style: isMobile ? AppTextStyles.headerLogoSmall : AppTextStyles.headerLogo),
                          ),
                          const Spacer(),
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
              const LineDivider(isVertical: false, width: double.infinity, height: 0, color: AppColors.primaryLight),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: Center(child: _buildMenuSection(isMobile),),
                ),
              ),
              const LineDivider(isVertical: false, width: double.infinity, height: 0.0, color: AppColors.primaryLight),
            ],
          );
        }
    );
  }

  Widget _buildMenuSection(bool isMobile) {
    final double spacing = isMobile ? 15.0 : 30.0;
    final style = isMobile ? AppTextStyles.headerMenuSmall : AppTextStyles.headerMenu;
    return Wrap(
      spacing: spacing,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        HoverButton(title: "Portfolio", style: style, onTap: () {}),
        _buildDivider(isMobile),
        HoverButton(title: "Blog", style: style, onTap: () {}),
        _buildDivider(isMobile),
        HoverButton(title: "Community", style: style, onTap: () {}),
      ],
    );
  }

  Widget _buildDivider(bool isMobile) {
    return LineDivider(
      isVertical: true,
      width: 1.0,
      height: isMobile ? 12.0 : 15.0,
      color: AppColors.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}