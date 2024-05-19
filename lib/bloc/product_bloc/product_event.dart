part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {}

class LoadAllProducts extends ProductEvent{
  @override
  List<Object?> get props => [];

}
