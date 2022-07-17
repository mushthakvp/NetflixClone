import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

class HomeImpliment  {
  static ValueNotifier<List<Downloads>> downloadNotifier = ValueNotifier([]);

  
  topTenTvShow() async {
    final Response respones =
        await Dio(BaseOptions()).get(ApiEndPoints.indianTv);
    if (respones.statusCode == 200 || respones.statusCode == 201) {
      final downloadsList = (respones.data['results'] as List).map((e) {
        return Downloads.fromJson(e);
      }).toList();
      downloadNotifier.value.clear();
      downloadNotifier.value.addAll(downloadsList);
      downloadNotifier.notifyListeners();
    }
  }
}
