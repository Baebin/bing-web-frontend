import 'dart:convert';

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
import 'package:bing_web_frontend/features/post/service/post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final _postResponseProvider = StateProvider.autoDispose<PostResponse?>((ref) => null);

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
      ref.read(_postResponseProvider.notifier).state = result;
    }
    else if (result is ApiErrorResponse) {
      context.showAlert(
        title: alertName,
        content: "게시글을 불러오지 못했습니다.\n${result.message} 😥",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Center(
      child: Container(
        width: size.isMobile ? double.infinity : 900,
        margin: EdgeInsets.symmetric(
          vertical: size.isMobile ? 20 : 50,
          horizontal: size.isMobile ? 10 : 20,
        ),
        decoration: BingBoxDecorations.commonBoard,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(size.isMobile ? 16.0 : 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleSection(size),
                    SizedBox(height: size.isMobile ? 20 : 30),
                    const LineDivider(isVertical: false, width: double.infinity, height: 0, color: BingColors.primaryLight),
                    SizedBox(height: size.isMobile ? 20 : 30),
                    _buildQuillViewer(),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection(Size size) {
    final accountService = ref.read(accountServiceProvider);
    final post = ref.watch(_postResponseProvider);

    final postTitle = post?.title ?? "";
    final postType = post?.type.name.toUpperCase() ?? "";
    final authorIdx = post?.authorIdx;
    final authorNickname = post?.authorNickname ?? "";
    final avatarUrl = authorIdx == null
        ? BingImages.logo.path
        : accountService.getAvatarUrl(authorIdx);

    final isMobile = size.isMobile;
    final double profileSize = isMobile ? 60 : 80;
    final double contentSpacing = isMobile ? 16 : 24;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(bottom: BorderSide(color: Colors.grey.shade100, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
    final post = ref.watch(_postResponseProvider);
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
}