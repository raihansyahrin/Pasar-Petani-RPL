import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pasar_petani/app/constant/constanta.dart';
import 'package:pasar_petani/app/data/model/saldo.dart';

class SaldoService {
  Future<Saldo?> fetchSaldo() async {
    try {
      http.Response response = await http.get(Uri.parse('$apiUrl/saldo'),
          headers: {'Authorization': 'Bearer ${GetStorage().read('token')}'});
      if (response.statusCode == 200) {
        return Saldo.fromJson(jsonDecode(response.body)[0]);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> penarikan(
      {required int idUang, required String nominal}) async {
    try {
      var url = Uri.parse("$apiUrl/saldo/tarik/$idUang");
      GetStorage storage = GetStorage();

      http.Response response = await http.post(url, headers: {
        "Authorization": "Bearer ${storage.read('token')}",
      }, body: {
        "nominal_penarikan": nominal,
      });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return throw Exception(e);
    }
  }
}
