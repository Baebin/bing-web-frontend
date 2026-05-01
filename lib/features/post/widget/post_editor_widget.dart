import 'dart:convert';

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

    return Center(
      child: Container(
        width: size.isMobile ? size.width * 0.9 : 850,
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: BingColors.primary.withValues(alpha: 0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
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
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
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
                config: const QuillSimpleToolbarConfig(
                  showFontFamily: false,
                  showFontSize: false,
                ),
              ),
            ),
            const SizedBox(width: 10),
            _buildUploadButton(),
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
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadButton() {
    final isLoading = ref.watch(_isLoadingProvider);
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: isLoading ? null : _uploadPost,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.send_rounded, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(
                "게시하기",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}