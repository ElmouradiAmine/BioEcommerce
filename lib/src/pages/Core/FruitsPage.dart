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
        GridView.count(
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
    
          
          children: <Widget>[
            productElement("banane.jpg", "Banane", 5),
            productElement("pomme.jpg", "Pomme", 5),
            productElement("pommeGolden.jpg", "Pomme Golden", 6),
            productElement("kiwi.jpg", "Kiwi", 10),
            productElement("fraise.jpg", "Fraise", 7),
            productElement("orange.jpg", "Orange", 8),
            productElement("avocat.jpg", "Avocat", 7),
            productElement("ananas.jpg", "Ananas", 8),
          ],
        )
      ]),
    );
  }

  Widget productElement(String image,String title, int price) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
          Expanded(
            flex: 3,
                      child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/fruits/" + image
              ),
            ),
          ),
          Text(title, textAlign: TextAlign.center,style: TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 18,
                    ),),
           Text("Prix : $price Dhs/kg", textAlign: TextAlign.center ,style: TextStyle(
                    
                     color: Colors.grey,
                     fontWeight: FontWeight.w500,
                     fontSize: 18,
                   ),),
                   SizedBox(
                     height: 10,
                   ),
          Expanded(
                      child: FlatButton(
              color: Colors.orange,
                onPressed: (){

                },
                child: Text("Ajouter au panier", style: TextStyle(
                  color: Colors.white,
                ),),),
          )
        ],),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white));
    
    /* Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),
        ], borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "images/produits/patateRouge.jpg"
                  )
                ),
                boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),
              ], borderRadius:BorderRadius.only(topLeft: Radius.circular(30),bottomLeft:Radius.circular(30) ), color: Colors.red),
              width: 150,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Product title", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("5 dhs / kg", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Product title", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),),
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );*/
  }
}
