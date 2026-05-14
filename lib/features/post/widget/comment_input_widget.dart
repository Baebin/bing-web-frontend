import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_images.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/dto/response/api_error_response.dart';
import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:bing_web_frontend/core/widgets/cached_image.dart';
import 'package:bing_web_frontend/core/widgets/line_divider.dart';
import 'package:bing_web_frontend/features/post/dto/request/comment_request.dart';
import 'package:bing_web_frontend/features/post/notifier/comment_list.dart';
import 'package:bing_web_frontend/features/post/service/comment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentInputBoxWidget extends ConsumerStatefulWidget {
  final int postIdx;
  final int? parentIdx;

  final String avatarUrl;
  final String hintText;

  final bool isMobile;

  const CommentInputBoxWidget({
    super.key,
    required this.postIdx,
    this.parentIdx,

    required this.avatarUrl,
    required this.hintText,

    required this.isMobile,
  });

  @override
  ConsumerState createState() => _CommentInputBoxWidgetState();
}

class _CommentInputBoxWidgetState extends ConsumerState<CommentInputBoxWidget> {
  static const alertName = "빙구단 댓글";

  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _sendComment() async {
    final content = _commentController.text.trim();
    if (content.isEmpty) return;
    final commentService = ref.read(commentServiceProvider);
    final result = await commentService.create(widget.postIdx, CommentRequest(content: content, parentIdx: widget.parentIdx));
    if (!mounted) return;
    if (result is bool && result == true) {
      _commentController.text = "";
      await ref.read(commentListProvider(widget.postIdx).notifier).refresh();
    }
    else if (result is ApiErrorResponse) {
      context.showAlert(
        title: alertName,
        content: "작성 실패: ${result.message} 😴",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  url: widget.avatarUrl,
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
                    controller: _commentController,
                    maxLines: null,
                    minLines: 2,
                    maxLength: 300,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
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
                  onPressed: _sendComment,
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
}