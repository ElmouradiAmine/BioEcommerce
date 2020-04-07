import 'package:ecommerce_app/models/CartProduct.dart';
import 'package:ecommerce_app/src/widgets/cart/cartList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<CartProduct> cartProducts = Provider.of<List<CartProduct>>(context);

    int calculatePoid(){
      int total = 0;
      for (var cartProduct in cartProducts){
        total += cartProduct.qte;
      }
      return total;

    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:Icon(Icons.arrow_back)),
        title: Text("Mon Panier"),
        actions: <Widget>[],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "images/background/vegetablePattern.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: CartList()
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:16.0),
               child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ],
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Nombre d'articles : ${cartProducts.length}",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                    Text("Poids : " + calculatePoid().toString() + " Kg",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                  ],
                ),
            ),
             ),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.orange,
              child: Text(
                "Valider ma commande",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              ),
            ),
          ],
        ),
      ),
    );
  }



  
}
