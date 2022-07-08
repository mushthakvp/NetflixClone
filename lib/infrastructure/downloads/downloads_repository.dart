import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/i_download_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

@LazySingleton(as: IdownloadRepo)
class DownloadsRepository implements IdownloadRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response respones =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (respones.statusCode == 200 || respones.statusCode == 201) {
        final List<Downloads> downloadsList = [];
        for (final row in respones.data) {
          downloadsList.add(Downloads.fromJson(row as Map<String, dynamic>));
        }
        return Right(downloadsList);
      } else {
        return const Left(MainFailures.serverFailures());
      }
    } catch (_) {
      return const Left(MainFailures.clientFailures());
    }
  }
}