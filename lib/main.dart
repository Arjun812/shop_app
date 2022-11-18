import 'package:flutter/material.dart';
import 'package:shop_app/services/route.dart';
import 'package:shop_app/widgets/tab_main.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const TabScreen(),
      routes: Routes().routeBuilders(context),
    );
  }
}

