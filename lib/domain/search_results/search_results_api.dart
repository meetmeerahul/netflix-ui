import 'dart:convert';

import 'package:neflix_ui/domain/search_results/search_model.dart';

import 'package:http/http.dart' as http;
import 'package:neflix_ui/infrastructure/api_key.dart';

class SearchApi {
  static Future<List<SearchResults>> getSearch(String value) async {
    print('Search Api recged');

    var client = http.Client();
    var uri =
        "https://api.themoviedb.org/3/search/movie?query=$value&api_key=$apiKey";
    List searchValues = [];
    var url = Uri.parse(uri);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final List<dynamic> results = json['results'];
      for (var values in results) {
        searchValues.add(values);
      }
    }
    // print(searchValues);
    return SearchResults.searchFromSnapshot(searchValues);
  }
}
