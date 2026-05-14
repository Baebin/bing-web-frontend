import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:bing_web_frontend/core/widgets/line_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListDetailWidget extends ConsumerStatefulWidget {
  const PostListDetailWidget({super.key});

  @override
  ConsumerState createState() => _PostListDetailWidgetState();
}

class _PostListDetailWidgetState extends ConsumerState<PostListDetailWidget> {
  Widget line =  LineDivider(isVertical: false, width: double.infinity, height: 0.5, color: Colors.black.withValues(alpha: 0.05));
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        const SizedBox(height: 40),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(size),
              const SizedBox(height: 10),
              const LineDivider(isVertical: false, width: double.infinity, height: 1, color: Colors.black12),

              const SizedBox(height: 10),

              _buildPaginationButtons(size),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(final Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: size.isMobile
                  ? BingTextStyles.postListRelatedHeaderSmall
                  : BingTextStyles.postListRelatedHeader,
              children: [
                TextSpan(
                  text: "빙구의 빈 공간",
                  style: TextStyle(
                    color: BingColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: "의 다른 "),
                TextSpan(
                  text: "커뮤니티 글",
                  style: TextStyle(
                    color: BingColors.primaryDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "전체글 보기",
            style: size.isMobile
                ? BingTextStyles.postListItemMetaSmall
                : BingTextStyles.postListItemMeta,
          ),
        ],
      ),
    );
  }

  Widget _buildPostListItem(Size size, String title, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: size.isMobile
                  ? BingTextStyles.postListItemTitleSmall
                  : BingTextStyles.postListItemTitle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            date,
            style: size.isMobile
                ? BingTextStyles.postListItemMetaSmall
                : BingTextStyles.postListItemMeta,
          ),
        ],
      ),
    );
  }

  Widget _buildPaginationButtons(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPageArrowButton(
            size,
            icon: Icons.arrow_back_ios_new,
            label: "이전",
            onTap: () {},
          ),
          const SizedBox(width: 30),
          _buildPageArrowButton(
            size,
            icon: Icons.arrow_forward_ios,
            label: "다음",
            isTrailingIcon: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPageArrowButton(
      Size size, {
        required IconData icon,
        required String label,
        required VoidCallback onTap,
        bool isTrailingIcon = false,
        bool isActive = false,
      }) {
    final color = isActive ? Colors.black87 : Colors.grey;
    final textStyle = size.isMobile
        ? BingTextStyles.postListItemMetaSmall.copyWith(color: color, fontWeight: FontWeight.w600)
        : BingTextStyles.postListItemMeta.copyWith(color: color, fontWeight: FontWeight.w600);
    final content = [
      Icon(icon, size: size.isMobile ? 12 : 14, color: color),
      const SizedBox(width: 4),
      Text(label, style: textStyle),
    ];

    return InkWell(
      onTap: isActive ? onTap : null,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: isTrailingIcon ? content.reversed.toList() : content,
        ),
      ),
    );
  }
}