import 'package:flutter/material.dart';
import 'package:foodendez_app/core/consts/router.dart';
import 'package:foodendez_app/features/intro/presentations/intro_page.dart';
import 'package:foodendez_app/features/main/presentations/about_page.dart';
import 'package:foodendez_app/features/main/presentations/home_page.dart';
import 'package:foodendez_app/features/main/presentations/product_detail_page.dart';
import 'package:foodendez_app/features/main/presentations/products_page.dart';

import 'features/intro/presentations/splash_page.dart';
import 'features/main/presentations/event_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ROUTER.splash: (context) => const SplashPage(),
        ROUTER.intro: (context) => const IntroPage(),
        ROUTER.home: (context) => const HomePage(),
        ROUTER.about: (context) => const AboutPage(),
        ROUTER.event: (context) => const EventPage(),
        ROUTER.products: (context) => const ProductsPage(),
        ROUTER.productDetail: (context) => const ProductDetailPage(),
      },
      initialRoute: ROUTER.splash,
    );
  }
}
