import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/CartProduct.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/services/cartService.dart';
import 'package:ecommerce_app/src/pages/Core/CartPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({this.product});

  @override
  Widget build(BuildContext context) {
    List<CartProduct> cartList = Provider.of<List<CartProduct>>(context) ?? [];
    Color color;
    switch (product.category) {
      case "vegetables":
        color = Colors.green;
        break;
      case "fruits":
        color = Colors.orange;
        break;
      case "medicine":
        color = Colors.blue;
        break;
      case "meat":
        color = Colors.red;
        break;
      case "other":
        color = Colors.brown;
        break;
    }


    User user = Provider.of<User>(context);
    addProductToCart(String uid) async {
    if (cartList.singleWhere((e)
        => e.idProd == product.id
    , orElse: () => null) == null)
      CartService(uid: uid).addProductToCart(product);
  }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: product.url,
                    placeholder: (context, url) => Container(
                        child: Center(child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Text(
                product.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: FlatButton(
                  color: color,
                  onPressed: () {
                    addProductToCart(user.uid);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartPage()));
                  },
                  child: Text(
                    "Ajouter au panier",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ], borderRadius: BorderRadius.circular(10), color: Colors.white)),
    );
  }

  
}
