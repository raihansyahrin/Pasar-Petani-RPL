import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pasar_petani/app/constant/constanta.dart';
import '../data/model/user.dart';

class UserService {
  Future<User?> fetchUser() async {
    GetStorage storage = GetStorage();
    http.Response response = await http.get(
      Uri.parse('$apiUrl/user'),
      headers: {
        'Authorization': 'Bearer ${storage.read('token')}',
        'Accept': 'application/json',
        'Content-Type':'application/json',
      },
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    }
    return null;
  }
}
