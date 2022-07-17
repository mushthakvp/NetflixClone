part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
  required  final List<HotAndNewData> comingSoonList,
  required  final List<HotAndNewData> everyoneWatchingList,
  required final bool isLoading,
    required final bool isError,
  

  }) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(comingSoonList: [], everyoneWatchingList: [], isError: false, isLoading: true,);
}
