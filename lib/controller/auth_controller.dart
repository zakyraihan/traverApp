import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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

        String authToken = dataRes.data.accessToken; // get token dari DataLogin
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('authToken', authToken); // set Token

        return authToken;
      }
    } catch (e) {
      log('Error -> $e');
    }
  }

  // ketika di reload dia tidak akan ke login lagi
  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken');
    log('Token -> $authToken');
    return authToken != null;
  }

  // untuk log out
  Future logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');

    Navigator.pushNamedAndRemoveUntil(context, '/intro', (route) => false);
  }
}
