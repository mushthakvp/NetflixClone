import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';

abstract class HotAndNewService{
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNewMoviedata();
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNewTvdata();
}