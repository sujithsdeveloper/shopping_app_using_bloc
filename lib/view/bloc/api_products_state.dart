part of 'api_products_bloc.dart';

 class ApiProductsState {}

 class ProductsInitialState extends ApiProductsState {}
 class ProductLoadingState extends ApiProductsState{}
 class ProductsLoadedState extends ApiProductsState {
  List<Product>? ProductDataList;
  ProductsLoadedState({this.ProductDataList});


 }
 class ProductsErrorState extends ApiProductsState {
  String? error;
  ProductsErrorState({this.error});
 }
