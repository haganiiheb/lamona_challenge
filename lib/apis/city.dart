import 'dart:convert';

import 'package:http/http.dart';

import '../constants/apis.dart';
import '../constants/identifiers.dart';
import '../models/city.dart';
import '../utils/api_functions.dart';

class CityApi {
  static CityApi instance = CityApi();

  Future<List<CityModel>> getCities({required String search}) async {
    try {
      Map<String, String> params = {
        USERNAME: "haganiiheb",
        MAX_ROWS: "5",
        "q": search,
      };

      Uri url = Uri.parse(cityUrl).replace(queryParameters: params);
      // print("URL : ========> $url");
      Response response = await get_(url);

      var body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        List _ = body[GEONAMES] as List? ?? [];
        // print(body);
        return _.map((e) => CityModel.fromJson(e)).toList();
      } else {
        // print("STATUS CODE : ====> ${response.statusCode}");

        return Future.error(body?[STATUS]?[MESSAGE]);
      }
    } catch (e) {
      // print(e);
      rethrow;
    }
  }
}
