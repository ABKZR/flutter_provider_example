import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/screens/home_screen.dart';
import 'controller/cart_controller.dart';

void main() {
  runApp(
    MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>CartController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home: HomePage(),
        
      ),
    );
  }
}
