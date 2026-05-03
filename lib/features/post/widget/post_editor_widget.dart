import 'dart:convert';

import 'package:bing_web_frontend/core/constants/bing_box_decorations.dart';
import 'package:bing_web_frontend/core/constants/bing_colors.dart';
import 'package:bing_web_frontend/core/constants/bing_text_styles.dart';
import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:bing_web_frontend/core/widgets/line_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final _isLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);

class PostEditorWidget extends ConsumerStatefulWidget {
  final Future<void> Function(String title, String content) upload;

  const PostEditorWidget({
    super.key,
    required this.upload,
  });

  @override
  ConsumerState<PostEditorWidget> createState() => _PostEditorWidgetState();
}

class _PostEditorWidgetState extends ConsumerState<PostEditorWidget> {
  final TextEditingController _titleController = TextEditingController();

  final QuillController _controller = QuillController.basic();

  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _titleController.dispose();
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _uploadPost() async {
    if (ref.read(_isLoadingProvider)) return;
    ref.read(_isLoadingProvider.notifier).state = true;

    final title = _titleController.text;
    final content = _controller.document.isEmpty() ? "" : jsonEncode(_controller.document.toDelta().toJson());

    await widget.upload(title, content);
    ref.read(_isLoadingProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final double verticalMargin = size.isMobile ? 10 : 50;

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: size.isMobile ? 20 : 50,
            horizontal: size.isMobile ? 10 : 20,
        ),
        constraints: BoxConstraints(
          maxWidth: 850,
        ),
        height: size.height - (verticalMargin * 2),
        padding: EdgeInsets.all(size.isMobile ? 12 : 20),
        decoration: BingBoxDecorations.commonBoard,
        child: _buildEditor(size),
      ),
    );
  }

  Widget _buildEditor(Size size) {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          autofocus: true,

          maxLength: 20,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textAlign: TextAlign.center,
          maxLines: null,
          textInputAction: TextInputAction.next,

          style: size.isMobile ? BingTextStyles.editorTitleSmall : BingTextStyles.editorTitle,

          onSubmitted: (_) => _focusNode.requestFocus(),

          decoration: InputDecoration(
            hintText: "제목을 입력하세요.",
            hintStyle: size.isMobile ? BingTextStyles.editorHintSmall : BingTextStyles.editorHint,
            contentPadding: EdgeInsets.symmetric(vertical: size.isMobile ? 10 : 20),
            border: InputBorder.none,
          ),
        ),

        const SizedBox(height: 10),
        const LineDivider(isVertical: false, width: double.infinity, height: 0, color: BingColors.primaryLight),
        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: QuillSimpleToolbar(
                controller: _controller,
                config: QuillSimpleToolbarConfig(
                  showFontFamily: false,
                  showFontSize: false,
                  showSubscript: false,
                  showSuperscript: false,
                  showSmallButton: false,
                  showInlineCode: false,
                  showDirection: false,
                  showSearchButton: false,

                  showBoldButton: true,
                  showItalicButton: true,
                  showUnderLineButton: true,
                  showStrikeThrough: false,
                  showColorButton: true,
                  showBackgroundColorButton: false,

                  showListNumbers: !size.isMobile,
                  showListBullets: true,
                  showListCheck: false,

                  showQuote: !size.isMobile,
                  showIndent: !size.isMobile,
                  showCodeBlock: !size.isMobile,
                  showLink: !size.isMobile,

                  showAlignmentButtons: !size.isMobile,

                  showRedo: !size.isMobile,
                  showUndo: !size.isMobile,

                  showHeaderStyle: !size.isMobile,

                  multiRowsDisplay: false,
                ),
              ),
            ),
            const SizedBox(width: 10),
            _buildUploadButton(size),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: QuillEditor.basic(
              controller: _controller,
              scrollController: _scrollController,
              focusNode: _focusNode,
              config: const QuillEditorConfig(
                placeholder: "이곳에 소중한 기록을 남겨주세요...",
                expands: true,
                scrollable: true,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadButton(Size size) {
    final isLoading = ref.watch(_isLoadingProvider);
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: isLoading ? null : _uploadPost,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.isMobile ? 12 : 20,
              vertical: size.isMobile ? 8 : 10
          ),
          decoration: BoxDecoration(
            color: BingColors.primary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: BingColors.primary.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.send_rounded, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(
                "게시하기",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: size.isMobile ? 13 : 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}