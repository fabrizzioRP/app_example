// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_field, sized_box_for_whitespace, dead_code

import 'package:app_examples/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
//
import 'widgets/car_sale.dart';
import 'widgets/details_shop.dart';
import 'package:app_examples/provider/logic_venta.dart';
import 'package:app_examples/screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LogicVenta()),
        ],
        child: MyApp(),
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        home: SplashScreen(),
        routes: {
          'homeScreen': (_) => HomeScreen(),
          'detailsShop': (_) => DetailsShopWidget(),
          'carSale': (_) => CarSaleWidget(),
        },
      );
}
