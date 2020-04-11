import 'package:ecommerce_app/models/CartProduct.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/services/auth.dart';
import 'package:ecommerce_app/services/cartService.dart';
import 'package:ecommerce_app/services/orderService.dart';
import 'package:ecommerce_app/services/productService.dart';
import 'package:ecommerce_app/services/userService.dart';
import 'package:ecommerce_app/src/pages/Core/CategorySelection.dart';
import 'package:ecommerce_app/src/pages/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/Product.dart';
import 'models/order.dart';
import 'models/userData.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: StreamProvider<List<Product>>.value(
        value: ProductService().products,
        child: MainApp(),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamProvider<UserData>.value(
        value: UserService(uid: user == null ? "" : user.uid).getUserData(),
        child: StreamProvider<List<CartProduct>>.value(
                  value: CartService(uid: user == null ? "" : user.uid).getCartProduct(),
                  child: StreamProvider<List<Order>>.value(
                    value: OrderService(uid: user == null ? "" : user.uid).getAllOrder(),
                                      child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(accentColor: Colors.orange),
              home: Wrapper()),
                  ),
        ));
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return user == null ? LoadingScreen() : CategorySelection();
  }
}
