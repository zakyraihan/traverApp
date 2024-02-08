import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/model/model.dart';

class HomeController {
  static final String _baseUrl = '${dotenv.env['IP']}';

  Future getKategori() async {
    try {
      Uri urlData = Uri.parse('$_baseUrl/kategori/list');

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Login? dataUser = loginFromJson(prefs.getString('login').toString());

      String? token = dataUser.data.accessToken;

      final response = await http.get(
        urlData,
        headers: {'Authorization': 'Bearer $token'},
      );

      log(response.body);

      if (response.statusCode == 200) {
        log(response.body);
        Kategori dataRes = Kategori.fromJson(json.decode(response.body));
        return dataRes.kategoriList;
      } else {
        throw Exception('gagal mengambil data');
      }
    } catch (e) {
      log('error -> $e');
      log('error fetching data');
    }
  }
}
