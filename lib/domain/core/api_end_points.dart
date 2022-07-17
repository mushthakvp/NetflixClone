import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = '$baseKey/trending/movie/week?api_key=$apiKey';

  static const search = '$baseKey/search/movie?api_key=$apiKey';

  static const hotAndNewMovie = '$baseKey/discover/movie?api_key=$apiKey';

  static const hotAndNewTv = '$baseKey/discover/tv?api_key=$apiKey';

  static const indianTv = 'https://api.themoviedb.org/3/discover/movie?api_key=3da1dd3c8475de48ad9316e931f6f373&with_origin_country=IN';
}
