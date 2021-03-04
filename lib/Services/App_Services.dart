import 'dart:convert';
import 'package:decago_test/Models/CarModel.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String url =
      "https://android-json-test-api.herokuapp.com/accounts";

  static Future<List<Carmodels>> getCars() async {
    final Response = await http.get(url);
    if (Response.statusCode == 200) {
      List<Carmodels> car = ParseCar(Response.body);
      return car;
    }
  }

  static List<Carmodels> ParseCar(String ResponseBody) {
    final parsed = json.decode(ResponseBody).cast<Map<String, dynamic>>();
    return parsed.map<Carmodels>((json) => Carmodels.fromJson(json)).toList();
  }
}
