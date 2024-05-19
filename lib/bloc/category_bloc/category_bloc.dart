// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:market/service/category/cateogry_service.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryService service;
  CategoryBloc(this.service) : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit)  async{
      if(event is LoadAllCategories){
        emit(LoadingCategories());
        try {
          final data = await service.getAllCategories();
          emit(LoadedCategories(categories: data));
        } catch (e) {
          emit(FailedToLoadCategories(error: e.toString()));
        }
      }
    });
  }
}
