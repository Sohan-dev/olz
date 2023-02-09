import 'package:http/http.dart' as http;
import 'package:olz/models/product/productModel.dart';

class ApiService {
  static var client = http.Client();

  static Future<List<Products>?> fetchProducts() async {
    try {
      var response =
          await client.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productFromJson(jsonString);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<http.Response?> getLogin() async {
    try {
      var response = await client.post(
          Uri.parse('https://uigdevelopment.sdinfoweb.com/api/client-login'));
    } catch (e) {
      rethrow;
    }
  }
}
