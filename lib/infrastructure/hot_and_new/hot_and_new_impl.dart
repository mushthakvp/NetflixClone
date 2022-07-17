import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplementation implements HotAndNewService{
  @override
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNewMoviedata() async {
   try {
      final Response respones = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
        
      );

      if (respones.statusCode == 200 || respones.statusCode == 201) {
        final hotAndNewResult = HotAndNewResp.fromJson(respones.data);

        return Right(hotAndNewResult);
      } else {
        return const Left(MainFailures.serverFailures());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailures());
    }
  }

  @override
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNewTvdata() async {
     try {
      final Response respones = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
        
      );

      if (respones.statusCode == 200 || respones.statusCode == 201) {
        final hotAndNewResult = HotAndNewResp.fromJson(respones.data);

        return Right(hotAndNewResult);
      } else {
        return const Left(MainFailures.serverFailures());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailures());
    }
  }
  
}