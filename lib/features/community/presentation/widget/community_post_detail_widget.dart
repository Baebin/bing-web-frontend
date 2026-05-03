import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:bing_web_frontend/features/post/widget/post_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final _postIdxProvider = StateProvider.autoDispose<int?>((ref) => null);

class CommunityPostDetailWidget extends ConsumerStatefulWidget {
  const CommunityPostDetailWidget({super.key});

  @override
  ConsumerState<CommunityPostDetailWidget> createState() => _CommunityPostDetailWidgetState();
}

class _CommunityPostDetailWidgetState extends ConsumerState<CommunityPostDetailWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => initIdx());
  }

  Future<void> initIdx() async {
    if (!mounted) return;

    final idxStr = context.queryParam("idx");
    final idx = idxStr != null ? int.tryParse(idxStr) : null;

    if (idx == null) return;

    ref.read(_postIdxProvider.notifier).state = idx;
  }

  @override
  Widget build(BuildContext context) {
    final idx = ref.watch(_postIdxProvider);
    if (idx == null) return SizedBox();
    return PostDetailWidget(idx: idx);
  }
}