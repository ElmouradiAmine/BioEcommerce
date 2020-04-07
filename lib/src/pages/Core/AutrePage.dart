import 'package:ecommerce_app/src/widgets/products/productList.dart';
import 'package:flutter/material.dart';

class AutrePage extends StatefulWidget {
  @override
  _AutrePageState createState() => _AutrePageState();
}

class _AutrePageState extends State<AutrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: (){

            },
            icon:Icon(Icons.shopping_basket))
        ],
        backgroundColor: Colors.brown,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:Icon(Icons.arrow_back)),
        title: Text("Autres"),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "images/background/vegetablePattern.jpg",
                ),
                fit: BoxFit.cover),
          ),
        ),
        ProductList(category: "other",)
      ]),
    );
  }

  
}
