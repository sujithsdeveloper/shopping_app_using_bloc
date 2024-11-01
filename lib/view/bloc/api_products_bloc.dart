import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:shopping_app/controller/products_controller.dart';
import 'package:shopping_app/model/productDetailModel.dart';
import 'package:shopping_app/model/productsModel.dart';
import 'package:http/http.dart' as http;
part 'api_products_event.dart';
part 'api_products_state.dart';

class ApiProductsBloc extends Bloc<ApiProductsEvent, ApiProductsState> {
  ApiProductsBloc() : super(ProductsInitialState()) {
    on<ApiProductsEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        await ProductsController().GetProducts();
        emit(ProductsLoadedState(
            ProductDataList: ProductsController.productList ?? []));
      } catch (e) {
        emit(ProductsErrorState(error: e.toString()));
      }
    });

    on<GetDataByIdEvent>(
      (event, emit) async {
        emit(ProductLoadingState());

        var url = Uri.parse('https://dummyjson.com/products/${event.id}');
        var response = await http.get(url);
        try {
          if (response.statusCode == 200) {
            emit(ProductsLoadedState(
                product: productDetailModelFromJson(response.body)));

            log(productDetailModelFromJson(response.body).category.toString());
          }
        } catch (e) {
          emit(ProductsErrorState(error: e.toString()));
        }
      },
    );
  }
}
