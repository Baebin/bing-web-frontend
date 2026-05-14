import 'dart:convert';

import 'package:bing_web_frontend/core/auth/auth_provider.dart';
import 'package:bing_web_frontend/core/constants/bing_box_decorations.dart';
import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_images.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/dto/response/api_error_response.dart';
import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/core/widgets/line_divider.dart';
import 'package:bing_web_frontend/features/account/service/account_service.dart';
import 'package:bing_web_frontend/features/post/dto/response/post_response.dart';
import 'package:bing_web_frontend/features/post/service/post_like_service.dart';
import 'package:bing_web_frontend/features/post/service/post_service.dart';
import 'package:bing_web_frontend/features/post/widget/comment_detail_widget.dart';
import 'package:bing_web_frontend/features/post/widget/post_list_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final _postResponseProvider = StateProvider.family.autoDispose<PostResponse?, int>((ref, idx) => null);

// 0: None / 1: Like / 2: Comment
final _footerIndexProvider = StateProvider.family.autoDispose<int, int>((ref, postIdx) => 0);

class PostDetailWidget extends ConsumerStatefulWidget {
  final int idx;

  const PostDetailWidget({
    super.key,
    required this.idx,
  });

  @override
  ConsumerState<PostDetailWidget> createState() => _PostDetailWidgetState();
}

class _PostDetailWidgetState extends ConsumerState<PostDetailWidget> {
  static const alertName = "빙구단 게시물";

  @override
  void initState() {
    super.initState();
    Future.microtask(() => initData());
  }

  Future<void> initData() async {
    if (!mounted) return;

    final postService = ref.read(postServiceProvider);
    final result = await postService.get(widget.idx);

    if (!mounted) return;
    if (result is PostResponse) {
      ref.read(_postResponseProvider(widget.idx).notifier).state = result;
    }
    else if (result is ApiErrorResponse) {
      context.showAlert(
        title: alertName,
        content: "게시글을 불러오지 못했습니다.\n${result.message} 😥",
      );
    }
  }

  void _toggleFooter(int nextIdx) {
    ref.read(_footerIndexProvider(widget.idx).notifier)
        .update((idx) => (idx == nextIdx) ? 0 : nextIdx);
  }

  Future<void> _toggleLike() async {
    final postLikeService = ref.read(postLikeServiceProvider);
    final result = await postLikeService.toggle(widget.idx) ;
    if (!mounted) return;
    if (result is bool) {
      await initData();
    }
    else if (result is ApiErrorResponse) {
      context.showAlert(
        title: alertName,
        content: "공감 실패: ${result.message} 😴",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Center(
      child: Container(
        width: size.isMobile ? double.infinity : 900,
        margin:  EdgeInsets.all(size.isMobile ? 0 : 20),
        decoration: size.isMobile
            ? BingBoxDecorations.commonMobileBoard
            : BingBoxDecorations.commonBoard,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                size.isMobile ? 16.0 : 32.0,
                size.isMobile ? 16.0 : 32.0,
                size.isMobile ? 16.0 : 32.0,
                size.isMobile ? 4.0 : 8.0,
              ),
              sliver: SliverMainAxisGroup(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: size.height * 0.3,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitleSection(size),
                          SizedBox(height: size.isMobile ? 20 : 30),
                          const LineDivider(isVertical: false, width: double.infinity, height: 0, color: BingColors.primaryLight),
                          SizedBox(height: size.isMobile ? 20 : 30),
                          _buildQuillViewer(),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: _buildPostFooterSection(),
                  ),
                  const SliverToBoxAdapter(
                    child: PostListDetailWidget(),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection(Size size) {
    final accountService = ref.read(accountServiceProvider);
    final post = ref.watch(_postResponseProvider(widget.idx));

    final postTitle = post?.title ?? "";
    final postType = post?.type.name.toUpperCase() ?? "";
    final authorIdx = post?.authorIdx;
    final authorNickname = post?.authorNickname ?? "";
    final avatarUrl = authorIdx == null
        ? BingImages.logo.path
        : accountService.getAvatarUrl(authorIdx);

    final isMobile = size.isMobile;
    final double profileSize = isMobile ? 60 : 100;
    final double contentSpacing = isMobile ? 16 : 24;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(bottom: BorderSide(color: Colors.grey.shade100, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedImage(
            url: avatarUrl,
            errorImageUrl: BingImages.logo.path,
            width: profileSize,
            height: profileSize,
            isCircle: true,
            hasSolidBorder: true,
            borderWidth: isMobile ? 2 : 3,
            borderColor: BingColors.primary.withValues(alpha: 0.1),
          ),
          SizedBox(width: contentSpacing),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postType,
                  style: isMobile
                      ? BingTextStyles.postDetailCategorySmall
                      : BingTextStyles.postDetailCategory,
                ),
                const SizedBox(height: 6),
                Text(
                  postTitle,
                  style: isMobile
                      ? BingTextStyles.postDetailTitleSmall
                      : BingTextStyles.postDetailTitle,
                ),
                SizedBox(height: isMobile ? 12 : 16),
                Row(
                  children: [
                    Text(
                      authorNickname,
                      style: isMobile
                          ? BingTextStyles.postDetailAuthorSmall
                          : BingTextStyles.postDetailAuthor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "•",
                      style: isMobile
                          ? BingTextStyles.postDetailMetaSmall
                          : BingTextStyles.postDetailMeta,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      post?.createdAt ?? "",
                      style: isMobile
                          ? BingTextStyles.postDetailMetaSmall
                          : BingTextStyles.postDetailMeta,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuillViewer() {
    final post = ref.watch(_postResponseProvider(widget.idx));
    final content = post?.content ?? "";
    Document doc;
    try {
      final data = jsonDecode(content);
      doc = Document.fromJson(data);
    } catch (e) {
      doc = Document()..insert(0, content);
    }
    final controller = QuillController(
      document: doc,
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );
    return QuillEditor.basic(
      controller: controller,
      config: const QuillEditorConfig(
        showCursor: false,
        autoFocus: false,
        expands: false,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildPostFooterSection() {
    final isBingJoined = ref.watch(isBingJoinedProvider).value ?? false;
    final post = ref.watch(_postResponseProvider(widget.idx));
    final footerIdx = ref.watch(_footerIndexProvider(widget.idx));
    return Column(
      children: [
        Row(
          children: [
            _buildToggleButton(
              icon: (post?.isLiked ?? false) ? Icons.favorite : Icons.favorite_border,
              isIconHighlighted: (post?.isLiked ?? false),
              label: "공감",
              count: post?.likeCount ?? 0,
              isSelected: (footerIdx == 1),
              onTap: () => _toggleFooter(1),
              onIconTap: isBingJoined ? () => _toggleLike() : null,
            ),
            const SizedBox(width: 8),
            _buildToggleButton(
              icon: Icons.chat_bubble_outline,
              isIconHighlighted: false,
              label: "댓글",
              count: post?.commentCount ?? 0,
              isSelected: (footerIdx == 2),
              onTap: () => _toggleFooter(2),
            ),
          ],
        ),
        if (footerIdx == 2) ... [
          CommentDetailWidget(postIdx: widget.idx),
        ],
      ],
    );
  }

  Widget _buildToggleButton({
    required IconData icon,
    required bool isIconHighlighted,
    required String label,
    required int count,
    required bool isSelected,
    required VoidCallback onTap,
    VoidCallback? onIconTap,
  }) {
    final activeColor = Colors.redAccent;
    final borderColor = isSelected ? activeColor : Colors.grey.shade300;
    final textColor = isSelected ? activeColor : Colors.black87;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onIconTap ?? onTap,
                child: Icon(
                    icon,
                    size: 18,
                    color: isIconHighlighted ? activeColor : textColor
                ),
              ),
              const SizedBox(width: 6),
              Text(
                "$label $count",
                style: BingTextStyles.postDetailMetaSmall.copyWith(
                  color: textColor,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox(width: 6),
              LineDivider(isVertical: true, width: 1, height: 12, color: isSelected ? activeColor.withValues(alpha: 0.3) : Colors.grey.shade300),
              const SizedBox(width: 6),
              Icon(
                isSelected ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                size: 18,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}