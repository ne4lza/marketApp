import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/bloc/category_bloc/category_bloc.dart';
import 'package:market/bloc/product_bloc/product_bloc.dart';
import 'package:market/components/mixin/home_view_mixin.dart';
import 'package:market/models/product_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with HomeViewMixin {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.blueGrey[200],
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60,),
        const Padding(
          padding:EdgeInsets.only(left: 10),
          child: Text(
            'Popüler Kategoriler',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
            ),
        ),
        SizedBox(
          height: 100,
          child: buildCategoryBlocListener()
        ),
        Flexible(
          child: buildProductBlocListener()
        ),
      ],
    ),
    floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.shopping_basket_outlined),
      onPressed: () => (),
    ),
    bottomNavigationBar: BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () => (), icon: const Icon(Icons.home)),
          IconButton(onPressed: () => (), icon: const Icon(Icons.person)),
        ],
      )
        
      
    ),
  );
}

  @override
  Card productCard(List<ProductModel> productList, int index) {
    return Card(
          elevation: 3,
          margin: EdgeInsets.zero,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  productList[index].image,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productList[index].title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5), 
                    const SizedBox(height: 5),
                    Text(
                      productList[index].category,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$ ${productList[index].price.toString()}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[600],
                        ),
                        const SizedBox(width: 2,),
                        Text(
                          productList[index].rating.toString()
                        ),
                        const SizedBox(width: 2,),
                        Text(
                          '(${productList[index].ratingCount.toString()})',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  TextButton(
                    child: const Text('SATIN AL'),
                    onPressed: () { /* Satın alma işlemi */ },
                  ),
                ],
              ),
            ],
          ),
        );
  }

  }

