import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/src/widgets/products/productTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  final String category;
  ProductList({this.category});

  @override
  Widget build(BuildContext context) {
    List<Product> products = (Provider.of<List<Product>>(context) ?? []).where((product) => 
      product.category == category
    ).toList();
    products.sort((a,b) => a.name.compareTo(b.name));
    return GridView.builder(
          
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2 ),
      itemBuilder: (context, index) {
        return ProductTile(product: products[index]);
      },
      itemCount: products.length,
          
        );
  }
}