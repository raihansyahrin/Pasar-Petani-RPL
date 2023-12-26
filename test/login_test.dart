import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pasar_petani/app/constant/constanta.dart';

import 'login_test.mocks.dart';

class AuthenticationService {
  final http.Client client;

  AuthenticationService({required this.client});

  Future<bool> login({required String email, required String password}) async {
    try {
      final response = await client.post(
        Uri.parse('$apiUrl/login'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

@GenerateMocks([http.Client])
void main() {
  group('Login Test', () {
    test("returns true if the login is successful", () async {
      final client = MockClient();
      when(
        client.post(
          Uri.parse('$apiUrl/login'),
          body: {'email': 'azisa6082@gmail.com', 'password': '123456789'},
        ),
      ).thenAnswer(
        (_) async => http.Response(
          '{"access_token": "4|sgpAhkViImmHZujFq7ocVaCS0l4P4n2pSkoi0ZYa223ace84","token_type": "Bearer","user": {"id": 1,"nama": "Abdul Azis Al Ayubbi","email": "azisa6980@gmail.com", "alamat": "JL DURI SELATAN IB RT 13 RW 02","foto": "/private/var/folders/d6/w2dnm0w15b76cw5f89gx23cc0000gn/T/phpwBHmP9","no_hp": "085893164214","created_at": "2023-09-27T04:15:01.000000Z","updated_at": "2023-09-27T04:15:01.000000Z"}}',
          200,
        ),
      );
      expect(
          await AuthenticationService(client: client)
              .login(email: "azisa6082@gmail.com", password: "123456789"),
          true);
    });
  });
  test("returns false if the login is unsuccessful", () async {
    final client = MockClient();
    when(
      client.post(
        Uri.parse('$apiUrl/login'),
        body: {'email': 'invalid@example.com', 'password': 'invalid_password'},
      ),
    ).thenAnswer(
      (_) async => http.Response('Invalid credentials', 401),
    );

    expect(
      await AuthenticationService(client: client)
          .login(email: 'invalid@example.com', password: 'invalid_password'),
      false,
    );
  });
}
