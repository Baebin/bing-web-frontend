import 'package:bing_web_frontend/features/post/dto/response/comment_with_paging_response.dart';
import 'package:bing_web_frontend/features/post/service/comment_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_list.g.dart';

@riverpod
class CommentList extends _$CommentList {
  @override
  FutureOr<CommentWithPagingResponse?> build(int postIdx) async {
    final service = ref.read(commentServiceProvider);
    final result = await service.getList(postIdx);
    return (result is CommentWithPagingResponse) ? result : null;
  }

  Future<void> fetchNextPage() async {
    if (state.isLoading || state.value?.isLast == true) return;

    final currentData = state.value;
    final service = ref.read(commentServiceProvider);

    final result = await service.getList(
        postIdx,
        lastParentIdx: currentData?.lastParentIdx
    );

    if (result is CommentWithPagingResponse) {
      state = AsyncValue.data(
        result.copyWith(
          comments: [...?currentData?.comments, ...result.comments],
        ),
      );
    }
  }
}