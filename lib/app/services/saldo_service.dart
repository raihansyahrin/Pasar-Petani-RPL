import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pasar_petani/app/constant/constanta.dart';
import 'package:pasar_petani/app/data/model/saldo.dart';

import '../data/model/history_saldo.dart';
class SaldoService {
  Future<Saldo?> fetchSaldo() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$apiUrl/saldo'),
        headers: {'Authorization': 'Bearer ${GetStorage().read('token')}'},
      );
      print(response.body);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody != null && responseBody.isNotEmpty) {
          return Saldo.fromJson(responseBody);
        }
        return null;
      }
      return null;
    } catch (e) {
      throw Exception('Failed to load saldo: $e');
    }
  }


  Future<bool> penarikan({required int idUang, required String nominal}) async {
    try {
      var url = Uri.parse("$apiUrl/saldo/tarik/$idUang");
      GetStorage storage = GetStorage();

      // Add content type header
      Map<String, String> headers = {
        "Authorization": "Bearer ${storage.read('token')}",
        "Content-Type": "application/x-www-form-urlencoded",
      };

      // Encode body as form data
      Map<String, String> body = {
        "nominal_penarikan": nominal,
      };

      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      print('penarikannn berhasil: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print('error penarikan: $e');
      throw Exception(e);
    }
  }

  Future<List<HistorySaldo>> getHistorySaldo() async {
    try {
      Uri uri = Uri.parse('$apiUrl/saldo');
      GetStorage storage = GetStorage();
      http.Response response = await http.get(uri,
          headers: {'Authorization': 'Bearer ${storage.read("token")}'});
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        // print('riawaya penarikan $responseBody');
        if (responseBody != null && responseBody.isNotEmpty) {
          List? data = responseBody['history'];
          print('history $data');
          if (data == null || data.isEmpty) {
            return [];
          } else {
            return data.map((e) => HistorySaldo.fromJson(e)).toList();
          }
        }
        return [];
      }
      return [];
    } catch (e, stackTrace) {
      // print(stackTrace)
      // throw Exception('Failed to load history saldo: $e');
      throw Exception('Failed to load history saldo: $e $stackTrace');
    }
  }
}
