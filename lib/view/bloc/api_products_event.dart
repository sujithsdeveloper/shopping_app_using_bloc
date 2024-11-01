part of 'api_products_bloc.dart';

 class ApiProductsEvent {}

class getDataEvent extends ApiProductsEvent{}
class GetDataByIdEvent extends ApiProductsEvent{
  int? id;
  GetDataByIdEvent({this.id});
}