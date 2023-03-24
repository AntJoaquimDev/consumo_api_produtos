import 'package:consumo_api2/pages/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Consumo Api',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.ProductPage);
            },
            child: const Text(
              'Listar Produtos',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
      ),
    );
  }
}
