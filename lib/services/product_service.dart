import 'package:http/http.dart' as http;
import 'package:huellitas_app/models/product.dart';

abstract class ProductService {
  static Future<ReqProductResponse> getProducts(int _pageNumber) async {
    final response = await http.get(
      Uri.parse(
          "https://huellitas-api.azurewebsites.net/api/Product?PageNumber=${_pageNumber.toString()}&&PageSize=10"),
    );

    if (response.statusCode == 200) {
      print("Get data from http call");
      return reqProductResponseFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load product');
    }
  }
}
