import 'package:bing_web_frontend/core/auth/auth_provider.dart';
import 'package:bing_web_frontend/core/constants/bing_box_decorations.dart';
import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_images.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/router/bing_route.dart';
import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/core/widgets/line_divider.dart';
import 'package:bing_web_frontend/features/account/service/account_service.dart';
import 'package:bing_web_frontend/features/post/common/post_type.dart';
import 'package:bing_web_frontend/features/post/dto/response/post_list_response.dart';
import 'package:bing_web_frontend/features/post/dto/response/post_with_paging_response.dart';
import 'package:bing_web_frontend/features/post/service/post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';

final _postPagingProvider = StateProvider.autoDispose<PostWithPagingResponse?>((ref) => null);
final _currentPageProvider = StateProvider.autoDispose<int>((ref) => 0);

class CommunityWidget extends ConsumerStatefulWidget {
  const CommunityWidget({super.key});

  @override
  ConsumerState<CommunityWidget> createState() => _CommunityWidgetState();
}

class _CommunityWidgetState extends ConsumerState<CommunityWidget> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _handlePostPaging(0);
  }

  Future<void> _handlePostPaging(int page) async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      final postService = ref.read(postServiceProvider);
      final result = await postService.getList(PostType.community, page: page, size: 8);
      if (result is PostWithPagingResponse) {
        ref.read(_postPagingProvider.notifier).state = result;
        ref.read(_currentPageProvider.notifier).state = result.currentPage;
      }
    } finally {
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final paging = ref.watch(_postPagingProvider);
    final hasItems = (paging?.totalPages ?? 0) >= 1;

    if (paging == null) WidgetsBinding.instance.addPostFrameCallback((_) => _handlePostPaging(0));

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.isMobile ? 20 : 50,
                  horizontal: size.isMobile ? 10 : 20
              ),
              constraints: BoxConstraints(
                maxWidth: 1000,
                minHeight: constraints.maxHeight - (size.isMobile ? 40 : 100),
              ),
              decoration: BingBoxDecorations.commonBoard,
              child: hasItems ? Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      _buildHeader(size),
                      if (!size.isMobile) _buildPostListHeader(size),
                      _buildPostItems(size),
                    ],
                  ),
                  Column(
                    children: [
                      _buildPagination(size),
                      SizedBox(height: size.isMobile ? 10 : 20),
                    ],
                  ),
                ],
              ) : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHeader(size),
                  _buildNonItems(size),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(Size size) {
    final isBingJoined = ref.watch(isBingJoinedProvider).value ?? false;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        size.isMobile ? 24 : 66,
        size.isMobile ? 24 : 40,
        size.isMobile ? 20 : 32,
        size.isMobile ? 16 : 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "빙구단 커뮤니티",
            style: size.isMobile ? BingTextStyles.postListMainTitleSmall : BingTextStyles.postListMainTitle,
          ),
          if (isBingJoined) ElevatedButton.icon(
            onPressed: () => context.goSafe(BingRoute.communityPost),
            icon: Icon(Icons.edit, size: size.isMobile ? 16 : 18),
            label: Text(
              "새글쓰기",
              style: size.isMobile ? BingTextStyles.buttonLabelSmall : BingTextStyles.buttonLabel,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: BingColors.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: size.isMobile ? 10 : 15,
                  horizontal: size.isMobile ? 12 : 15
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostListHeader(Size size) {
    final headerStyle = size.isMobile ? BingTextStyles.postListHeaderSmall : BingTextStyles.postListHeader;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
        color: BingColors.primary.withValues(alpha: 0.03),
      ),
      child: Row(
        children: [
          SizedBox(width: 42),
          Expanded(
            child: Text("제목", style: headerStyle),
          ),
          SizedBox(width: 60, child: Text("조회", textAlign: TextAlign.center, style: headerStyle)),
          SizedBox(width: 60, child: Text("댓글", textAlign: TextAlign.center, style: headerStyle)),
          SizedBox(width: 100, child: Text("작성일", textAlign: TextAlign.center, style: headerStyle)),
        ],
      ),
    );
  }

  Widget _buildNonItems(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.forum_outlined,
          size: size.isMobile ? 60 : 80,
          color: BingColors.primary.withValues(alpha: 0.6),
        ),
        const SizedBox(height: 20),
        Text(
          "아직 등록된 이야기가 없어요.",
          style: size.isMobile
              ? BingTextStyles.postListMainTitleSmall.copyWith(color: BingColors.textSecondary)
              : BingTextStyles.postListMainTitle.copyWith(color: BingColors.textSecondary),
        ),
        const SizedBox(height: 8),
        Text(
          "첫 번째 이야기의 주인공이 되어보세요! 🧊",
          style: size.isMobile ? BingTextStyles.postListItemMetaSmall : BingTextStyles.postListItemMeta,
        ),
      ],
    );
  }

  Widget _buildPostItems(Size size) {
    final paging = ref.watch(_postPagingProvider);

    if (paging == null || paging.posts.isEmpty) {
      return const SizedBox();
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: paging.posts.length,
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: LineDivider(isVertical: false, width: double.infinity, height: 0, color: BingColors.primaryLight),
      ),
      itemBuilder: (context, index) => _buildPostItem(size, paging.posts[index]),
    );
  }

  Widget _buildPostItem(Size size, PostListResponse post) {
    final accountService = ref.read(accountServiceProvider);
    return InkWell(
      onTap: null,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Row(
          children: [
            CachedImage(
              url: accountService.getAvatarUrl(post.authorIdx),
              errorImageUrl: BingImages.logo.path,
              width: 32,
              height: 32,
              isCircle: true,
            ),
            const SizedBox(width: 10),

            Expanded(
              child: size.isMobile ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: BingTextStyles.postListItemTitleSmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            _buildMobileStatItem(Icons.remove_red_eye_outlined, post.viewCount.toString()),
                            const SizedBox(width: 8),
                            _buildMobileStatItem(Icons.chat_bubble_outline, post.commentCount.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    post.createdAt.split(" ").first,
                    style: BingTextStyles.postListItemMetaSmall,
                  ),
                ],
              ) : Text(
                post.title,
                style: BingTextStyles.postListItemTitle,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            if (!size.isMobile) ...[
              _buildStatItem(size, Icons.remove_red_eye_outlined, post.viewCount.toString()),
              _buildStatItem(size, Icons.chat_bubble_outline, post.commentCount.toString()),
              SizedBox(
                width: 100,
                child: Text(
                  post.createdAt.split(" ").first,
                  style: BingTextStyles.postListItemMeta,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(Size size, IconData icon, String value) {
    return SizedBox(
      width: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 14, color: Colors.grey.withValues(alpha: 0.7)),
          const SizedBox(width: 4),
          Text(
            value,
            style: size.isMobile ? BingTextStyles.postListItemMetaSmall : BingTextStyles.postListItemMeta,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileStatItem(IconData icon, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: BingColors.textSecondary.withValues(alpha: 0.6)),
        const SizedBox(width: 2),
        Text(
          value,
          style: BingTextStyles.postListItemMetaSmall,
        ),
      ],
    );
  }

  Widget _buildPagination(Size size) {
    final paging = ref.watch(_postPagingProvider);
    final currentPage = ref.watch(_currentPageProvider);
    final totalPages = paging?.totalPages ?? 1;

    final int maxVisiblePages = size.isMobile ? 5 : 10;
    final int groupIndex = currentPage ~/ maxVisiblePages;

    final int startPage = groupIndex * maxVisiblePages;
    int endPage = startPage + maxVisiblePages;
    if (endPage > totalPages) endPage = totalPages;

    final int visibleCount = endPage - startPage;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (groupIndex > 0) ... [
            _buildArrowButton(
              icon: Icons.keyboard_double_arrow_left,
              onPressed: () => _handlePostPaging(0),
            ),
            _buildArrowButton(
              icon: Icons.chevron_left,
              onPressed: () => _handlePostPaging(startPage - 1),
            ),
          ],
          ...List.generate(visibleCount, (index) {
            final pageNum = startPage + index;
            final isSelected = currentPage == pageNum;

            return InkWell(
              onTap: () => _handlePostPaging(pageNum),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? BingColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? BingColors.primary : Colors.grey.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  "${pageNum + 1}",
                  style: BingTextStyles.postPagingNumber.copyWith(
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            );
          }),
          if (endPage < totalPages) ... [
            _buildArrowButton(
              icon: Icons.chevron_right,
              onPressed: () => _handlePostPaging(endPage),
            ),
            _buildArrowButton(
              icon: Icons.keyboard_double_arrow_right,
              onPressed: () => _handlePostPaging(totalPages - 1),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildArrowButton({required IconData icon, required VoidCallback? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      color: BingColors.primary,
      visualDensity: VisualDensity.compact,
    );
  }
}