import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:neflix_ui/domain/popular_movies/popular_movies_model.dart';

import 'package:neflix_ui/infrastructure/api_key.dart';

class PopularApi {
  static Future<List<PopularMoviesResults>> getPopularMovies() async {
    const url = "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

    final response = await http.get(Uri.parse(url));
    List tempList = [];
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process the jsonData as per your requirements
      print(jsonData);

      for (var v in jsonDecode(response.body)['results']) {
        tempList.add(v);
      }

      print("*********************");
      log(tempList.toString());
    }
    return PopularMoviesResults.popularFromSnapshot(tempList);
  }
}
