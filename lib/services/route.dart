import 'package:flutter/material.dart';
import 'package:shop_app/pages/cart/view/cart.dart';
import 'package:shop_app/pages/history/view/history.dart';
import 'package:shop_app/pages/homePage/view/home_page.dart';
import 'package:shop_app/widgets/tab_main.dart';

import '../pages/homePage/view/single_product_view.dart';

class Routes {

  static const String tabMain = 'tab';
  static const String home = 'home';
  static const String cart = 'cart';
  static const String history = 'history';
  static const String singleProduct = 'singleProduct';


  Map<String, WidgetBuilder> routeBuilders(BuildContext context) {
    return {
      tabMain: (context) => const TabScreen(),
      home: (context) => const HomePage(),
      history: (context) => const History(),
      cart: (context) => const Cart(),
      singleProduct: (context) => const SingleProductView(),
    };
  }
}