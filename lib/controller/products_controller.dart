import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shopping_app/model/productsModel.dart';

class ProductsController {
  ProductModel? productModel;
  List<Product>? productList = [];
  Future<void> GetProducts() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      productModel = productModelFromJson(response.body);
      productList = productModel!.products;
      
    }
  }
}
