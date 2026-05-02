import 'package:bing_web_frontend/core/dto/response/api_error_response.dart';
import 'package:bing_web_frontend/core/router/bing_route.dart';
import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:bing_web_frontend/features/post/common/post_type.dart';
import 'package:bing_web_frontend/features/post/dto/request/post_request.dart';
import 'package:bing_web_frontend/features/post/service/post_service.dart';
import 'package:bing_web_frontend/features/post/widget/post_editor_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CommunityPostWidget extends ConsumerStatefulWidget {
  const CommunityPostWidget({super.key});

  @override
  ConsumerState<CommunityPostWidget> createState() => _CommunityPostWidgetState();
}

class _CommunityPostWidgetState extends ConsumerState<CommunityPostWidget> {
  static const alertName = "빙구단 소식통";

  Future<void> _handleUpload(String title, String content) async {
    final postService = ref.read(postServiceProvider);
    final result = await postService.upload(
      PostRequest(title: title, content: content, type: PostType.community)
    );
    if (!mounted) return;
    if (result is bool && result == true) {
      context.showAlert(
        title: alertName,
        content: "**당신의 이야기**가 커뮤니티 광장에\n울려 퍼지기 시작했습니다! 🎤\n\n단원님의 소중한 글이 안전하게 등록되었어요.\n지금 바로 다른 단원들과 **빙구리빙빙** 소통해 보세요!",
        onConfirm: () => context.go(BingRoute.community),
      );
    }
    else if (result is ApiErrorResponse) {
      context.showAlert(
        title: alertName,
        content: "접수 실패: ${result.message} 😥",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PostEditorWidget(upload: _handleUpload);
  }
}