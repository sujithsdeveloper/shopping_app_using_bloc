import 'package:bloc/bloc.dart';
import 'package:shopping_app/controller/products_controller.dart';
import 'package:shopping_app/model/productsModel.dart';

part 'api_products_event.dart';
part 'api_products_state.dart';

class ApiProductsBloc extends Bloc<ApiProductsEvent, ApiProductsState> {
  ApiProductsBloc() : super(ProductsInitialState()) {
    on<ApiProductsEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {

        emit(ProductsLoadedState(
            ProductDataList: await ProductsController().productList));
      } catch (e) {
        emit(ProductsErrorState(error: e.toString()));
      }
    });
  }
}
