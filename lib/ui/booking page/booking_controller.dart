import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/model/model.dart';

class PaymentController {
  static final String _baseUrl = '${dotenv.env['IP']}';

  Future getPayment() async {
    // await Future.delayed(const Duration(seconds: 2));
    String url = "${dotenv.env['IP']}/payment/list";
    Uri urlData = Uri.parse(url);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString('TOKEN').toString());
    String token = 'Bearer ${dataUser.data.accessToken}';

    final response = await http.get(urlData, headers: {'Authorization': token});

    if (response.statusCode == 200) {
      Payment data = paymentFromJson(response.body.toString());
      return data.data;
    } else {
      return null;
    }
  }

  Future bookingProses(
    int idWisata,
    String nameBooking,
    int qtyBooking,
    String contactBooking,
    String tglBooking,
    int idPayment,
  ) async {
    try {
      Uri urlData = Uri.parse('$_baseUrl/booking/create');

      Map bookingData = {
        "date_booking": tglBooking,
        "id_wisata": idWisata,
        "name_booking": nameBooking,
        "contact_booking": contactBooking,
        "qty_booking": qtyBooking,
        "status_booking": false,
        "id_payment": idPayment
      };

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Login dataUser = loginFromJson(prefs.getString("TOKEN").toString());
      String token = "Bearer ${dataUser.data.accessToken}";

      final response = await http.post(
        urlData,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": token,
        },
        body: jsonEncode(bookingData),
      );

      if (response.statusCode == 200) {
        print('Data Booking Berhasil Dikirim');
        print('Response API: ${response.body}');
      } else {
        print('Gagal mengirim data. Status Code: ${response.statusCode}');
        print('Response API: ${response.body}');
      }
    } catch (e) {
      log('Error -> $e');
    }
  }

  Future getBooking() async {
    Uri urlData = Uri.parse('$_baseUrl/booking/list');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString('TOKEN').toString());
    String token = 'Bearer ${dataUser.data.accessToken}';

    final response = await http.get(urlData, headers: {'Authorization': token});

    if (response.statusCode == 200) {
      print('Response API: ${response.body}');
      Booking data = bookingFromJson(response.body.toString());
      return data.data;
    } else {
      print('Response API: ${response.body}');
      return null;
    }
  }
}
