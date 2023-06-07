import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:neflix_ui/domain/upcoming/upcoming_model.dart';
import 'package:neflix_ui/infrastructure/api_key.dart';

class UpcomingMovieApi {
  static Future<List<UpcomingMovieResults>> getUpcomingMovies() async {
    const url = "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";

    final response = await http.get(Uri.parse(url));
    List tempList = [];
    if (response.statusCode == 200) {
      jsonDecode(response.body);
      // Process the jsonData as per your requirements
      //  print(jsonData);

      for (var v in jsonDecode(response.body)['results']) {
        tempList.add(v);
      }
      //log(tempList.toString());
    }
    return UpcomingMovieResults.upcomingMoviesFromSnapshot(tempList);
  }
}
