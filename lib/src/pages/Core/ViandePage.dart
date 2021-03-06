import 'package:ecommerce_app/src/widgets/products/productList.dart';
import 'package:flutter/material.dart';

class ViandePage extends StatefulWidget {
  @override
  _ViandePageState createState() => _ViandePageState();
}

class _ViandePageState extends State<ViandePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_basket))
        ],
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:Icon(Icons.arrow_back)),
        title: Text("Viandes"),
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
        ProductList(category: "meat",)
      ]),
    );
  }

}
