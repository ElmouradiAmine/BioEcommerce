import 'package:ecommerce_app/src/pages/Authentification/AuthSelectionPage.dart';
import 'package:ecommerce_app/src/pages/Authentification/LogInPage.dart';
import 'package:ecommerce_app/src/pages/Authentification/SignInPage.dart';
import 'package:ecommerce_app/src/pages/Core/CartPage.dart';
import 'package:ecommerce_app/src/pages/Core/CategorySelection.dart';
import 'package:ecommerce_app/src/pages/Core/FruitsPage.dart';
import 'package:ecommerce_app/src/pages/Core/LegumesPage.dart';
import 'package:ecommerce_app/src/pages/Core/ViandePage.dart';
import 'package:ecommerce_app/src/pages/LoadingScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Colors.orange),
      home: CartPage(),
    );
  }
}
