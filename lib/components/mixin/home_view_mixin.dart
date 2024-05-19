import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/bloc/category_bloc/category_bloc.dart';
import 'package:market/bloc/product_bloc/product_bloc.dart';
import 'package:market/models/product_model.dart';
import 'package:market/pages/home.dart';

mixin HomeViewMixin on State<Home> {
  Card productCard(List<ProductModel> productList, int index);

  Widget buildCategoryBloc(){
    return BlocBuilder<CategoryBloc,CategoryState>(
      builder: (context, state) {
        if(state is LoadedCategories){
          List<String> categoryList = state.categories;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 100,
                  height: 30,
                  margin: const EdgeInsets.only(top: 10,right: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18)
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    categoryList[index].toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              );
            },
          );
          
        }
        return Container();
      },
      
    );
    
  }

  Widget buildProductBloc(){
    return BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadedProducts) {
            List<ProductModel> productList = state.products;
            return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.45,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return productCard(productList, index);
        },
      ),
    );
          }
          return const SizedBox();
        },
      );
  }

  Widget buildCategoryBlocListener(){
    return BlocBuilder<CategoryBloc,CategoryState>(
            builder: (context, state) {
              if(state is LoadingCategories){
                  return const Center(
                  child:
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  )
                 );
              }
              if(state is LoadedCategories){
                return buildCategoryBloc();
              }
              if(state is FailedToLoadCategories){
                return Text(state.error);
              }

              return const SizedBox();
            },
          );
  }

  Widget buildProductBlocListener(){
    return BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is LoadingProducts) {
                 return const Center(
                  child:
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(),
                  )
                 );
              }
              if(state is LoadedProducts){
                  return buildProductBloc();
              }
              if (state is FailedLoadProducts) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: AlertDialog(
                          title: const Text('Hata'), content: Text(state.error)),
                    );
                  },
                );
              }
              return Container();
            },
          );
  }
}