part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {}

final class ProductInitial extends ProductState {
  @override
  List<Object?> get props =>[];
}

final class LoadingProducts extends ProductState{
  @override
  List<Object?> get props =>[];
}

final class LoadedProducts extends ProductState{
  final List<ProductModel> products;
  LoadedProducts(this.products);
  
  @override
  List<Object?> get props =>[products];
}

final class FailedLoadProducts extends ProductState {
  final String error;
  FailedLoadProducts(this.error);
  
  @override
  List<Object?> get props =>[error];
}
