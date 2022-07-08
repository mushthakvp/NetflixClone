import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/downloads/i_download_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
part 'downloads_bloc.freezed.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadState> {
  final IdownloadRepo downloadsRepo;
  DownloadsBloc(this.downloadsRepo) : super(DownloadState.initial()) {
    on<_GetDownloadsImage>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
            downloadOrFailure: none(),
          ),
        );
        final Either<MainFailures, List<Downloads>> downloadsValue =
            await downloadsRepo.getDownloadsImages();
        emit(
          downloadsValue.fold(
            (failure) => state.copyWith(
              isLoading: false,
              downloadOrFailure: Some(
                left(failure),
              ),
            ),
            (success) => state.copyWith(
              isLoading: false,
              downloadOrFailure: Some(
                right(success),
              ),
              downloads: success,
            ),
          ),
        );
      },
    );
  }
}
