// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/models/product_model.dart';
import 'package:market/service/product_service/product_service.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService service;
  ProductBloc(this.service) : super(ProductInitial())  {
    on<ProductEvent>((event, emit) async {
      if(event is LoadAllProducts){
        emit(LoadingProducts());
        try {
          final products = await service.getAllProducts();
          emit(LoadedProducts(products));
        } catch (e) {
          emit(FailedLoadProducts(e.toString()));
        }
      }
    });
  }
}
