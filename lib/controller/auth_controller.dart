import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/model/model.dart';

class AuthController {
  static String url = '${dotenv.env['IP']}';

  Future registerProses(String nama, String email, String password,
      String konfirmasiPassword) async {
    try {
      Uri urlData = Uri.parse('$url/auth/register');

      Map data = {
        "nama": nama,
        "email": email,
        "password": password,
        "konfirmasiPassword": konfirmasiPassword
      };

      var body = json.encode(data);

      final response = await http.post(urlData,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 201) {
        log(response.body);
        Register dataResponse = registerFromJson(response.body.toString());
        return dataResponse;
      } else {
        return null;
      }
    } catch (e) {
      log("error -> $e");
    }
  }

  Future loginProses(String email, String password) async {
    try {
      // String url = '${dotenv.env['IP']}/auth/login';
      Uri urlData = Uri.parse('$url/auth/login');

      Map data = {
        "email": email,
        "password": password,
      };

      var body = json.encode(data);

      final response = await http.post(urlData,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 201) {
        log(response.body);
        Login loginRes = loginFromJson(response.body.toString());
        return loginRes;
      } else {
        throw Exception();
      }
    } catch (e) {
      log('Error -> $e');
    }
  }
}
