import 'dart:convert';
import 'dart:developer';
import 'package:aromize_app/models/product.dart';
import 'package:aromize_app/utils/api.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  static Future<void> getProduct({
    required Function(List<GetProduct> Products) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        'Accept': 'application/json',
      };

      var url = Uri.parse(Api.getproductUrl);
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      //log("Service ${data.toString()}");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<GetProduct> products = productFromJson(data["data"]);

        //print(serviceFromJson(data["Category"]).toString());
        onSuccess(products);
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
