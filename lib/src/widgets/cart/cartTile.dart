import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/services/cartService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final Product product;
  final int qte;

  CartTile({this.product, this.qte});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 150,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                    child: CachedNetworkImage(
                      imageUrl: product.url,
                      placeholder: (context, url) => Container(
                          child: Center(child: CircularProgressIndicator())),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: 1,
                    height: double.infinity,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 21.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  if (qte > 1)
                                    CartService(uid: user.uid)
                                        .removeQte(product);
                                  if (qte == 1) {
                                    CartService(uid: user.uid)
                                        .removeProduct(product.id);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.red,
                                    child:
                                        Icon(Icons.remove, color: Colors.white),
                                  ),
                                ),
                              ),
                              Text(
                                qte.toString() + " kg",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  CartService(uid: user.uid).addQte(product);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.green,
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ]),
          ),
          GestureDetector(
            onTap: () {
              CartService(uid: user.uid).removeProduct(product.id);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                height: 20,
                width: 20,
                child: Center(
                    child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
