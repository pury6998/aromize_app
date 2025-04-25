import 'dart:convert';
import 'dart:developer';

import 'package:aromize_app/models/users.dart';
import 'package:aromize_app/utils/api.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  static Future<void> login({
    required String email,
    required String password,
    required Function(Users user, String token) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      log("message");
      var headers = {
        "Accept": "application/json",
      };
      var body = {"email": email, "password": password, "type": "customer"};
      log(body.toString());
      http.Response response = await http.post(Uri.parse(Api.loginUrl),
          headers: headers, body: body);
      dynamic data = jsonDecode(response.body);
      log(data.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        String accessToken = data["token"].toString();
        Users user = Users.fromJson(data["data"]);
        onSuccess(user, accessToken);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
