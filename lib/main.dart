import 'package:consumo_api2/pages/home/home_pege.dart';
import 'package:consumo_api2/pages/home/product_page.dart';
import 'package:consumo_api2/pages/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumo Api',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      //home: const HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HomePage: (_) => const HomePage(),
        AppRoutes.ProductPage: (_) => const ProductPage(),
      },
    );
  }
}
