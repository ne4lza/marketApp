import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/bloc/category_bloc/category_bloc.dart';
import 'package:market/bloc/product_bloc/product_bloc.dart';
import 'package:market/pages/home.dart';
import 'package:market/pages/login.dart';
import 'package:market/service/auth_service/auth_service.dart';
import 'package:market/service/category/cateogry_service.dart';
import 'package:market/service/product_service/product_service.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductService(),
        ),
        RepositoryProvider(
          create: (context) => CategoryService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(AuthService()),
          ),
          BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(
              RepositoryProvider.of<ProductService>(context),
            )..add(LoadAllProducts()),
          ),
          BlocProvider<CategoryBloc>(
            create: (context) =>
                CategoryBloc(RepositoryProvider.of<CategoryService>(context))
                  ..add(LoadAllCategories()),
          )
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/Home': (context) => const Home()},
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent)),
      home: const LoginPage(),
    );
  }
}
