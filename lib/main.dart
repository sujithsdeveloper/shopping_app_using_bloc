import 'package:flutter/material.dart';
import 'package:shopping_app/view/HomeScreen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/view/bloc/api_products_bloc.dart';
import 'package:shopping_app/view/bloc/product_details_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductDetailsBloc()),
        BlocProvider(create: (context) => ApiProductsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
