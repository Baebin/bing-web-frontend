import 'package:bing_web_frontend/core/auth/auth_provider.dart';
import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_images.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/features/account/service/account_service.dart';
import 'package:bing_web_frontend/features/auth/dto/response/account_response.dart';
import 'package:bing_web_frontend/features/post/dto/response/comment_response.dart';
import 'package:bing_web_frontend/features/post/notifier/comment_list.dart';
import 'package:bing_web_frontend/features/post/widget/comment_input_widget.dart';
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
    final isMobile = MediaQuery.sizeOf(context).isMobile;
    final userProfile = ref.watch(userProfileProvider).value;
    final commentList = ref.watch(commentListProvider(widget.postIdx));

    return commentList.when(
      data: (data) {
        if (data == null || data.comments.isEmpty) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(child: Text("첫 번째 댓글을 남겨보세요! 😊")),
              ),
              const SizedBox(height: 20),
              if (userProfile?.idx != null) ... [
                _buildInputBox(isMobile, userProfile),
              ],
            ],
          );
        }
        return Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.comments.length,
              separatorBuilder: (context, index) => Container(),
              itemBuilder: (context, index) => _CommentItem(userProfile: userProfile, postIdx: widget.postIdx, comment: data.comments[index], isMobile: isMobile),
            ),
            if (!data.isLast)
              OutlinedButton(
                onPressed: () => ref.read(commentListProvider(widget.postIdx).notifier).fetchNextPage(),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: StadiumBorder(),
                ),
                child: Text("댓글 더보기", style: TextStyle(color: Colors.grey.shade600)),
              ),
            if (userProfile?.idx != null)
              _buildInputBox(isMobile, userProfile),
          ],
        );
      },
      error: (err, stack) => Center(child: Text("댓글을 불러오지 못했습니다. $err")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildInputBox(bool isMobile, AccountResponse? userProfile) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CommentInputBoxWidget(
          postIdx: widget.postIdx,
          avatarUrl: ref.read(accountServiceProvider).getAvatarUrl(userProfile!.idx),
          hintText: "빙구 같은 댓글 부탁드립니다.",
          isMobile: isMobile,
        ),
      );
  }
}

class _CommentItem extends ConsumerStatefulWidget {
  final AccountResponse? userProfile;
  final CommentResponse comment;
  final int postIdx;
  final bool isMobile;
  final bool isChild;

  const _CommentItem({
    super.key,
    required this.userProfile,
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

  final TextEditingController _replyCommentController = TextEditingController();

  @override
  void dispose() {
    _replyCommentController.dispose();
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
                    if (widget.userProfile?.idx != null) ... [
                      const SizedBox(height: 6),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => ref.read(activeReplyCommentIdxProvider.notifier).update((idx) {
                            if (idx == widget.comment.idx) return null;
                            return widget.comment.idx;
                          }),
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
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),

        if (isReplying)
          Padding(
            padding: EdgeInsets.only(
                left: widget.isMobile ? 32 : 60,
                right: 16,
                top: 4,
                bottom: 12
            ),
            child: CommentInputBoxWidget(
                postIdx: widget.postIdx,
                parentIdx: widget.comment.idx,
                avatarUrl: widget.comment.authorAvatarUrl,
                hintText: "${widget.comment.authorNickname}님에게 답글 달기",
                isMobile: widget.isMobile,
            ),
          ),

        if (widget.comment.children.isNotEmpty)
          ...widget.comment.children.map((child) => _CommentItem(
            userProfile: widget.userProfile,
            comment: child,
            postIdx: widget.postIdx,
            isMobile: widget.isMobile,
            isChild: true,
          )),
      ],
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
    if (_replyCommentController.text.trim().isEmpty) return;
  }
}