part of 'api_products_bloc.dart';

 class ApiProductsState {}

 class ProductsInitialState extends ApiProductsState {}
 class ProductLoadingState extends ApiProductsState{}
 class ProductsLoadedState extends ApiProductsState {
  List<Product> ProductDataList;
   ProductDetailModel? product;
  ProductsLoadedState({this.ProductDataList=const [],this.product});
 }
 class ProductsErrorState extends ApiProductsState {
  String? error;
  ProductsErrorState({this.error});
 }
