import 'package:flutter/material.dart';
import 'package:TB_MOBILE/HomePage.dart';
import 'package:TB_MOBILE/providers/product/product_form_screen.dart';
import 'package:TB_MOBILE/providers/product/product_home_screen.dart';
import 'package:TB_MOBILE/providers/salles/salles_form_screen.dart';
import 'package:TB_MOBILE/providers/salles/salles_home_screen.dart';
import 'package:TB_MOBILE/providers/stock/stock_form_screen.dart';
import 'package:TB_MOBILE/providers/stock/stock_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/product': (context) => productPages(),
        '/add-product': (context) => ProductFormPage(),
        '/stock': (context) => StockPages(),
        '/add-stock': (context) => StockFormPage(),
        '/reseler': (context) => reselerPages(),
        '/add-reseler': (context) => ReselerFormPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      home: const WelcomePage(),
    );
  }
}
