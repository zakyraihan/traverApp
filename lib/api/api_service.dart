import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/model/model.dart';

class ApiService {
  static final String _baseUrl = '${dotenv.env['IP']}';

  final String token;
  ApiService(this.token);

  Future<Kategori> getData(String token) async {
    try {
      Uri url = Uri.parse('$_baseUrl/kategori/list');

      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        log(response.body);
        return Kategori.fromJson(json.decode(response.body));
      } else {
        throw Exception('gagal mengambil kategori data');
      }
    } catch (e) {
      log('error -> $e');
      throw Exception('gagal mengambil kategori data');
    }
  }
}
