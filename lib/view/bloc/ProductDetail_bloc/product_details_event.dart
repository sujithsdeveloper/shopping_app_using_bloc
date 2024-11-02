part of 'product_details_bloc.dart';

class ProductDetailsEvent {}

class FetchProcuctById extends ProductDetailsEvent {
  final int productId;
  FetchProcuctById({required this.productId});
}
