import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/constants.dart';
import 'home_screen.dart';
import 'home_page.dart';
void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(textTheme:Theme.of(context).textTheme.apply(bodyColor: kTextColor)),
    home:HomePage()
  );
  }
}