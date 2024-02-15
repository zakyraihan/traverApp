import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel_app/api/api_service.dart';
import 'package:travel_app/common/result_state.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/model/model.dart';

class KategoriProvider extends ChangeNotifier {
  final ApiService apiService;

  KategoriProvider({required this.apiService}) {
    fetchKategoriData();
  }

  late Kategori _kategoriResult;
  late ResultState _state;
  String _message = '';

  Kategori get result => _kategoriResult;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> fetchKategoriData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      String? userToken = await AuthController().getToken();

      // memvalidasi token
      if (userToken == null) {
        _state = ResultState.error;
        notifyListeners();
        return _message = 'Token not available';
      }

      // Menggunakan token untuk fetch data
      final kategori = await apiService.fetchKategories(userToken);

      if (kategori.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'empty data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _kategoriResult = kategori;
      }
    } catch (e) {
      log('$e');
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Terjadi Kesalahan';
    }
  }
}
