import 'dart:convert';
import 'dart:developer';
import 'package:aromize_app/models/Category.dart';
import 'package:aromize_app/utils/api.dart';
import 'package:http/http.dart' as http;

class AllCategoryRepo {
  static Future<void> getAllCategory({
    required Function(List<Category> categories) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        'Accept': 'application/json',
      };

      var url = Uri.parse(Api.getCategoryUrl);
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      //log("Service ${data.toString()}");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<Category> categories = serviceFromJson(data["data"]);

        //print(serviceFromJson(data["Category"]).toString());
        onSuccess(categories);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry! something went wrong");
    }
  }
}
