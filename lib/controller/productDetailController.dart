// import 'package:http/http.dart' as http;
// import 'package:shopping_app/model/productDetailModel.dart';


// class Productdetailcontroller {
//   ProductDetailModel? product;
//   Future<void> fetchProductById(String id) async {
//     var url=Uri.parse('https://dummyjson.com/products/$id');
//     var response=await http.get(url);
//     if(response.statusCode==200){
//     product=  productDetailModelFromJson(response.body);
//     }
//   }
// }