import 'dart:convert';
import 'dart:developer';

import 'package:aromize_app/models/users.dart';
import 'package:aromize_app/utils/api.dart';
import 'package:http/http.dart' as http;

class RegisterRepo {
  static Future<void> register({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required Function(Users user, String token) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };

      var body = {
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      };

      log("Registration request: ${body.toString()}");

      http.Response response = await http.post(
        Uri.parse(Api.registerUrl),
        headers: headers,
        body: body,
      );

      dynamic data = jsonDecode(response.body);
      log("Registration response: ${data.toString()}");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Handle successful registration
        String token = data["data"]["token"] ?? "";
        Users user = Users.fromJson(data["data"]);
        onSuccess(user, token);
      } else {
        // Handle API errors
        onError(data["message"] ?? "Registration failed");
      }
    } catch (e, s) {
      log("Registration error: ${e.toString()}");
      log("Stack trace: ${s.toString()}");
      onError("Sorry, something went wrong. Please try again.");
    }
  }
}