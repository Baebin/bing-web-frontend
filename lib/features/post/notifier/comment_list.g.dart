// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CommentList)
final commentListProvider = CommentListFamily._();

final class CommentListProvider
    extends $AsyncNotifierProvider<CommentList, CommentWithPagingResponse?> {
  CommentListProvider._({
    required CommentListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'commentListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentListHash();

  @override
  String toString() {
    return r'commentListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CommentList create() => CommentList();

  @override
  bool operator ==(Object other) {
    return other is CommentListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentListHash() => r'231a2df67d36ca8fde257a090ac0481e7e528339';

final class CommentListFamily extends $Family
    with
        $ClassFamilyOverride<
          CommentList,
          AsyncValue<CommentWithPagingResponse?>,
          CommentWithPagingResponse?,
          FutureOr<CommentWithPagingResponse?>,
          int
        > {
  CommentListFamily._()
    : super(
        retry: null,
        name: r'commentListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CommentListProvider call(int postIdx) =>
      CommentListProvider._(argument: postIdx, from: this);

  @override
  String toString() => r'commentListProvider';
}

abstract class _$CommentList
    extends $AsyncNotifier<CommentWithPagingResponse?> {
  late final _$args = ref.$arg as int;
  int get postIdx => _$args;

  FutureOr<CommentWithPagingResponse?> build(int postIdx);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<CommentWithPagingResponse?>,
              CommentWithPagingResponse?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CommentWithPagingResponse?>,
                CommentWithPagingResponse?
              >,
              AsyncValue<CommentWithPagingResponse?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
