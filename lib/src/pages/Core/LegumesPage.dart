import 'package:ecommerce_app/src/widgets/products/productList.dart';
import 'package:flutter/material.dart';

class LegumesPage extends StatefulWidget {
  @override
  _LegumesPageState createState() => _LegumesPageState();
}

class _LegumesPageState extends State<LegumesPage> {
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
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:Icon(Icons.arrow_back)),
        title: Text("Légumes"),
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
        ProductList(category: "vegetables",)
      ]),
    );
  }

  
}
