part of 'api_products_bloc.dart';

class ApiProductsState {}

class ProductsInitialState extends ApiProductsState {}

class ProductLoadingState extends ApiProductsState {}

class ProductsLoadedState extends ApiProductsState {
  List<Product> productDataList;
  ProductDetailModel? product;
  ProductsLoadedState({this.productDataList = const [], this.product});
}

class ProductsErrorState extends ApiProductsState {
  String? error;
  ProductsErrorState({this.error});
}
