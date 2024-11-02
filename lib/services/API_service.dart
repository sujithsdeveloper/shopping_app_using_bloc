import 'package:http/http.dart' as http;
import 'package:shopping_app/model/productsModel.dart';

class ApiService {
  ProductModel? productModel;
  static List<Product>? productList = [];
  Future<void> getProducts() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      productModel = productModelFromJson(response.body);
      productList = productModel!.products;
    }
  }
}
