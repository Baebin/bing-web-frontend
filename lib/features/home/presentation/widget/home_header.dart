import 'package:bing_web_frontend/core/auth/auth_provider.dart';
import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_images.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/router/bing_route.dart';
import 'package:bing_web_frontend/core/utils/extensions/box_constraints_extension.dart';
import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/core/widgets/hover_button.dart';
import 'package:bing_web_frontend/core/widgets/line_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends ConsumerWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBingJoined = ref.watch(isBingJoinedProvider).value ?? false;
    return LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.isMobile;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                color: BingColors.primary.withValues(alpha: 0.3),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 10 : 15,
                          horizontal: isMobile ? 15 : 30
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CachedImage(
                                  url: BingImages.logo.path,
                                  width: isMobile ? 40 : 65,
                                  height: isMobile ? 40 : 65,
                                  isCircle: true,
                                  hasSolidBorder: true,
                                  borderWidth: isMobile ? 2.0 : 3.0,
                                  borderColor: BingColors.primary,
                                  onTap: () => context.pushSafe(BingRoute.home),
                                ),
                                const SizedBox(width: 20),
                                Flexible(
                                  child: HoverButton(
                                      title: "빙구의 빈 공간",
                                      style: isMobile ? BingTextStyles.headerLogoSmall : BingTextStyles.headerLogo,
                                      onTap: () => context.pushSafe(BingRoute.home)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          HoverButton(
                              title: isBingJoined ? "Profile" : "Login",
                              style: isMobile ? BingTextStyles.headerMenuSmall : BingTextStyles.headerMenu,
                              onTap: () => context.pushSafe(isBingJoined ? BingRoute.profile : BingRoute.login)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const LineDivider(isVertical: false, width: double.infinity, height: 0, color: BingColors.primaryLight),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: Center(child: _buildMenuSection(context, isMobile)),
                ),
              ),
              const LineDivider(isVertical: false, width: double.infinity, height: 0.0, color: BingColors.primaryLight),
            ],
          );
        }
    );
  }

  Widget _buildMenuSection(BuildContext context, bool isMobile) {
    final double spacing = isMobile ? 15.0 : 30.0;
    final style = isMobile ? BingTextStyles.headerMenuSmall : BingTextStyles.headerMenu;
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
        HoverButton(title: "Community", style: style, onTap: () => context.goSafe(BingRoute.community)),
      ],
    );
  }

  Widget _buildDivider(bool isMobile) {
    return LineDivider(
      isVertical: true,
      width: 1.0,
      height: isMobile ? 12.0 : 15.0,
      color: BingColors.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}