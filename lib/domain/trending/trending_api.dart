import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:neflix_ui/domain/trending/trending_model.dart';
import 'package:neflix_ui/infrastructure/api_key.dart';

class TrendingApi {
  static Future<List<Results>> getTrendingMovies() async {
    const url =
        "https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey";

    final response = await http.get(Uri.parse(url));
    List tempList = [];
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process the jsonData as per your requirements
      print(jsonData);

      for (var v in jsonDecode(response.body)['results']) {
        tempList.add(v);
      }
      log(tempList.toString());
    }
    return Results.trendingFromSnapshot(tempList);
  }
}
