import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  //generic and simple get api
  static Future<http.Response> getRandomCatFactAPI() async {
    return await http.get(
      Uri.parse('https://catfact.ninja/fact'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
