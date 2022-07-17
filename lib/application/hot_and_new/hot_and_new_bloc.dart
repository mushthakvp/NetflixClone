import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';
part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService hotAndNewService;
  HotAndNewBloc(this.hotAndNewService) : super(HotAndNewState.initial()) {
    on<LoadDataInComingSoon>((event, emit) async {
      if (state.comingSoonList.isNotEmpty) {
        emit(
          state.copyWith(
            comingSoonList: state.comingSoonList,
            everyoneWatchingList: state.everyoneWatchingList,
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          comingSoonList: [],
          everyoneWatchingList: [],
          isLoading: true,
          isError: false,
        ),
      );
      // get hot and movie data
      final _result = await hotAndNewService.getHotAndNewMoviedata();
      final newState = _result.fold(
        (MainFailures failure) {
          return state.copyWith(
            comingSoonList: [],
            everyoneWatchingList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          return state.copyWith(
            comingSoonList: resp.results,
            everyoneWatchingList: state.everyoneWatchingList,
            isLoading: false,
            isError: false,
          );
        },
      );

      emit(newState);
    });

    // get hot and movie data
    on<LoadDataInEveryoneWatching>((event, emit) async {
      if (state.everyoneWatchingList.isNotEmpty) {
        emit(
          state.copyWith(
            comingSoonList: state.comingSoonList,
            everyoneWatchingList: state.everyoneWatchingList,
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          comingSoonList: [],
          everyoneWatchingList: [],
          isLoading: true,
          isError: false,
        ),
      );
      // get hot and movie data
      final _result = await hotAndNewService.getHotAndNewTvdata();
      final newState = _result.fold(
        (MainFailures failure) {
          return state.copyWith(
            comingSoonList: [],
            everyoneWatchingList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          return state.copyWith(
            comingSoonList: state.comingSoonList,
            everyoneWatchingList: resp.results,
            isLoading: false,
            isError: false,
          );
        },
      );

      emit(newState);
    });
  }
}
