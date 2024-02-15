import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/model/model.dart';

class ApiService {
  static final String _baseUrl = '${dotenv.env['IP']}';

  final String token;
  ApiService(this.token);

  Future<Kategori> fetchKategories(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/kategori/list'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        log(response.body);
        return Kategori.fromJson(json.decode(response.body.toString()));
      } else {
        log(response.body);
        throw Exception('Failed To Fetch Kategori data');
      }
    } catch (e) {
      log('Error -> $e');
      throw Exception('Failed To Fetch Kategori Data');
    }
  }
}
