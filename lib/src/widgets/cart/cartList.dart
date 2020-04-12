import 'package:ecommerce_app/models/CartProduct.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/services/cartService.dart';
import 'package:ecommerce_app/src/widgets/cart/cartTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {

  CartList();

  @override
  Widget build(BuildContext context) {
    List<CartProduct> cartProducts = Provider.of<List<CartProduct>>(context) ?? [];
    List<Product> products = Provider.of<List<Product>>(context) ?? [];
    if (products != null){
      products = products.where((product){
      for (CartProduct cartProduct in cartProducts){
        if (product.id == cartProduct.idProd) return true;
      }
      return false;
    }
    ).toList();
    } else {
      products = [];
    }
    

    List<CartTile> listCartTile = cartProducts.map((cartProduct){
      if (products.singleWhere((p) => p.id == cartProduct.idProd) !=null)
        return  CartTile(product: products.singleWhere((p) => p.id == cartProduct.idProd), qte: cartProduct.qte);
      return null;
    }).toList();
    return ListView(
      
      children: 
      listCartTile,
    );
   /* final List<Product> products = Provider.of<List<Product>>(context).where((product) => 
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
          
        )
        */
        
  }


  
}