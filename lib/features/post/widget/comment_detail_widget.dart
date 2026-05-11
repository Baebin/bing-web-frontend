import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_images.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/core/widgets/line_divider.dart';
import 'package:bing_web_frontend/features/post/dto/response/comment_response.dart';
import 'package:bing_web_frontend/features/post/notifier/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class CommentDetailWidget extends ConsumerStatefulWidget {
  final int postIdx;

  const CommentDetailWidget({super.key, required this.postIdx});

  @override
  ConsumerState<CommentDetailWidget> createState() => _CommentDetailWidgetState();
}

class _CommentDetailWidgetState extends ConsumerState<CommentDetailWidget> {
  @override
  Widget build(BuildContext context) {
    final commentList = ref.watch(commentListProvider(widget.postIdx));
    final isMobile = MediaQuery.sizeOf(context).isMobile;

    return commentList.when(
      data: (data) {
        if (data == null || data.comments.isEmpty) {
          return const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Center(child: Text("첫 번째 댓글을 남겨보세요! 😊")),
          );
        }
        return Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.comments.length,
              separatorBuilder: (context, index) => const LineDivider(isVertical: false, width: double.infinity, height: 0, color: BingColors.primaryLight),
              itemBuilder: (context, index) => _CommentItem(postIdx: widget.postIdx, comment: data.comments[index], isMobile: isMobile),
            ),
            if (!data.isLast)
              TextButton(
                onPressed: () => ref.read(commentListProvider(widget.postIdx).notifier).fetchNextPage(),
                child: const Text("댓글 더보기"),
              ),
          ],
        );
      },
      error: (err, stack) => Center(child: Text("댓글을 불러오지 못했습니다. $err")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _CommentItem extends ConsumerStatefulWidget {
  final CommentResponse comment;
  final int postIdx;
  final bool isMobile;
  final bool isChild;

  const _CommentItem({
    super.key,
    required this.comment,
    required this.postIdx,
    required this.isMobile,
    this.isChild = false,
  });

  @override
  ConsumerState<_CommentItem> createState() => _CommentItemState();
}

final activeReplyCommentIdxProvider = StateProvider.autoDispose<int?>((ref) => null);

class _CommentItemState extends ConsumerState<_CommentItem> {
  bool isReplying = false;

  final TextEditingController _replyController = TextEditingController();

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeReplyCommentIdx = ref.watch(activeReplyCommentIdxProvider);
    final bool isReplying = (activeReplyCommentIdx == widget.comment.idx);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: widget.isChild ? (widget.isMobile ? 32 : 48) : 16,
            right: 16,
            top: 12,
            bottom: 12,
          ),
          color: widget.isChild ? Colors.grey.withValues(alpha: 0.02) : Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.isChild)
                const Padding(
                  padding: EdgeInsets.only(right: 8, top: 4),
                  child: Icon(Icons.subdirectory_arrow_right, size: 16, color: Colors.grey),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CachedImage(
                          url: widget.comment.authorAvatarUrl,
                          errorImageUrl: BingImages.logo.path,
                          width: widget.isMobile ? 16 : 24,
                          height: widget.isMobile ? 16 : 24,
                          isCircle: true,
                          hasSolidBorder: true,
                          borderWidth: widget.isMobile ? 1.0 : 1.5,
                          borderColor: BingColors.primary,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.comment.authorNickname,
                          style: widget.isMobile ? BingTextStyles.commentAuthorSmall : BingTextStyles.commentAuthor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.comment.content,
                      style: widget.isMobile ? BingTextStyles.commentBodySmall : BingTextStyles.commentBody,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.comment.createdAt,
                      style: widget.isMobile ? BingTextStyles.commentMetaSmall : BingTextStyles.commentMeta,
                    ),
                    const SizedBox(height: 6),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => ref.read(activeReplyCommentIdxProvider.notifier).state = widget.comment.idx,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: isReplying ? Colors.grey.shade300 : Colors.white,
                            borderRadius: BorderRadius.circular(2.0),
                            border: Border.all(
                              color: isReplying ? Colors.grey.shade400 : Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            "답글",
                            style: widget.isMobile ? BingTextStyles.commentButtonLabelSmall : BingTextStyles.commentButtonLabel,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        if (isReplying) _buildReplyInputBox(),

        if (widget.comment.children.isNotEmpty)
          ...widget.comment.children.map((child) => _CommentItem(
            comment: child,
            postIdx: widget.postIdx,
            isMobile: widget.isMobile,
            isChild: true,
          )),
      ],
    );
  }

  Widget _buildReplyInputBox() {
    return Container(
      margin: EdgeInsets.only(
          left: widget.isMobile ? 32 : 60,
          right: 16,
          top: 4,
          bottom: 12
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedImage(
                  url: widget.comment.authorAvatarUrl,
                  errorImageUrl: BingImages.logo.path,
                  width: widget.isMobile ? 16 : 24,
                  height: widget.isMobile ? 16 : 24,
                  isCircle: true,
                  hasSolidBorder: true,
                  borderWidth: widget.isMobile ? 1.0 : 1.5,
                  borderColor: BingColors.primary,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _replyController,
                    maxLines: null,
                    minLines: 2,
                    maxLength: 300,
                    decoration: InputDecoration(
                      hintText: "${widget.comment.authorNickname}님에게 답글 쓰기",
                      hintStyle: widget.isMobile ? BingTextStyles.commentInputHintSmall : BingTextStyles.commentInputHint,
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          LineDivider(isVertical: false, width: double.infinity, height: 1.0, color: Colors.grey.shade300),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.grey.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _iconBtn(Icons.emoji_emotions_outlined, "스티커"),
                    _iconBtn(Icons.camera_alt_outlined, "사진"),
                  ],
                ),
                TextButton(
                  onPressed: _submitReply,
                  child: Text(
                    "등록",
                    style: widget.isMobile ? BingTextStyles.commentSubmitSmall : BingTextStyles.commentSubmit,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconBtn(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 4),
          Text(
            label,
            style: widget.isMobile ? BingTextStyles.commentInputToolSmall : BingTextStyles.commentInputTool,
          ),
        ],
      ),
    );
  }

  Future<void> _submitReply() async {
    if (_replyController.text.trim().isEmpty) return;
  }
}