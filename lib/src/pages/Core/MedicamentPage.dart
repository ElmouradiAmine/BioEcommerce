import 'package:ecommerce_app/src/widgets/products/productList.dart';
import 'package:flutter/material.dart';

class MedicamentPage extends StatefulWidget {
  @override
  _MedicamentPageState createState() => _MedicamentPageState();
}

class _MedicamentPageState extends State<MedicamentPage> {
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
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:Icon(Icons.arrow_back)),
        title: Text("Médicaments"),
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
        ProductList(category: "medicine",)
      ]),
    );
  }

  
}
