import 'dart:convert';
import 'dart:developer';

import 'package:aromize_app/utils/api.dart';
import 'package:http/http.dart' as http;

class AddToCartRepo {
  static Future<void> addToCart({
    required int productId,
    required int quantity,
    required Function(List<Map<String, dynamic>> cartItems) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      log("Adding to cart");
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "product_id": productId.toString(),
        "quantity": quantity.toString(),
      };
      log(body.toString());

      // Sending the request to the add to cart API endpoint
      http.Response response = await http.post(
        Uri.parse(Api.addtocartUrl),
        headers: headers,
        body: body,
      );

      dynamic data = jsonDecode(response.body);
      log(data.toString());

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Assuming the response returns the cart items directly or a confirmation of the added product
        List<Map<String, dynamic>> cartItems = (data["data"] as List)
            .map((item) => item as Map<String, dynamic>)
            .toList();
        onSuccess(cartItems);  // Return the cart items as a list of maps
      } else {
        onError(data["message"]);  // Error handling
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry, something went wrong");
    }
  }
}
