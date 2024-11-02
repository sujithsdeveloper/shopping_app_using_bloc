import 'package:bloc/bloc.dart';
import 'package:shopping_app/model/productDetailModel.dart';
import 'package:http/http.dart' as http;

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductLoadingState()) {
    on<FetchProcuctById>((event, emit) async {
      emit(ProductLoadingState());
      final url =
          Uri.parse("https://dummyjson.com/products/${event.productId}");

      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          emit(ProductLoadedState(
              product: productDetailModelFromJson(response.body)));
        }
      } catch (e) {
        emit(ProductErrorState());
      }
    });
  }
}
