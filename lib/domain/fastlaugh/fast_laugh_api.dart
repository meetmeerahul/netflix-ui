import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:neflix_ui/domain/fastlaugh/fast_laugh_model.dart';

import 'package:neflix_ui/infrastructure/api_key.dart';

class FastLaughApi {
  static Future<List<FastLaughListResult>> getFastLaugh() async {
    const url =
        "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";

    final response = await http.get(Uri.parse(url));
    List tempList = [];
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process the jsonData as per your requirements
      print(jsonData);

      for (var v in jsonDecode(response.body)['results']) {
        tempList.add(v);
      }

      // print("*********************");
      //log(tempList.toString());
    }
    return FastLaughListResult.fastLaughFromSnapshot(tempList);
  }
}
