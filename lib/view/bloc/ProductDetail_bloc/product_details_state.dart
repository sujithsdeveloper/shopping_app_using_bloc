
part of 'product_details_bloc.dart';
class ProductDetailsState {}

final class ProductLoadingState extends ProductDetailsState {}

final class ProductLoadedState extends ProductDetailsState {
  ProductDetailModel? product;
  ProductLoadedState({this.product});
}

final class ProductErrorState extends ProductDetailsState {
  String? error;
  ProductErrorState({this.error});
}
