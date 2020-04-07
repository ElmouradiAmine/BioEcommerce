import 'package:ecommerce_app/src/widgets/products/productList.dart';
import 'package:flutter/material.dart';

class FruitsPage extends StatefulWidget {
  @override
  _FruitsPageState createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {
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
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:Icon(Icons.arrow_back)),
        title: Text("Fruits"),
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
        ProductList(category: "fruits",),
        
      ]),
    );
  }

}
