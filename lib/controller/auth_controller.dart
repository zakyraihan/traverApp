import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/model/model.dart';

class AuthController {
  Future registerProses(String nama, String email, String password,
      String konfirmasiPassword) async {
    String url = '${dotenv.env['IP']}/auth/register';
    Uri urlData = Uri.parse(url);

    Map data = {
      "nama": nama,
      "email": email,
      'password': password,
      'konfirmasiPassword': konfirmasiPassword,
    };

    var body = json.encode(data);

    final response = await http.post(urlData,
        headers: {"Content-Type": "application/json"}, body: body);

    if (response.statusCode == 201) {
      Register dataRes = registerFromJson(response.body.toString());
      return dataRes;
    } else {
      return null;
    }
  }

  Future loginProses(String email, String password) async {
    String url = '${dotenv.env['IP']}/auth/login';
    Uri urlData = Uri.parse(url);

    Map data = {
      "email": email,
      "password": password,
    };

    var body = json.encode(data);

    final response = await http.post(urlData,
        headers: {"Content-Type": "application/json"}, body: body);

    try {
      if (response.statusCode == 201) {
        log(response.body);
        Login dataRes = loginFromJson(response.body.toString());
        return dataRes;
      }
    } catch (e) {
      log('Error -> $e');
    }
  }
}
