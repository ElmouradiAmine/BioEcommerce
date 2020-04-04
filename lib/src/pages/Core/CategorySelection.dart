import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/src/pages/Core/CartPage.dart';
import 'package:ecommerce_app/src/pages/Core/FruitsPage.dart';
import 'package:ecommerce_app/src/pages/Core/LegumesPage.dart';
import 'package:ecommerce_app/src/pages/Core/ViandePage.dart';
import 'package:flutter/material.dart';

class CategorySelection extends StatefulWidget {
  @override
  _CategorySelectionState createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.menu),
        actions: <Widget>[
          IconButton(
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage()));},
            icon: Icon(
             Icons.shopping_basket
            
           
          ))
        ],
        centerTitle: true,
        title: Text("Menu"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/background/vegetablePattern.jpg"),
            )),
          ),
          GridView.count(
            padding: EdgeInsets.only(top: 30),
            crossAxisCount: 2,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LegumesPage()));
                  },
                  child: gridTile("legumes.jpg", "Légumes", Colors.green)),
              GestureDetector(
                 onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FruitsPage()));
                  },
                child: gridTile("fruits.jpg", "Fruits", Colors.orange)),
              gridTile("cereale.jpg", "Céreales", Colors.brown),
              GestureDetector(
                 onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ViandePage()));
                  },
                child: gridTile("charcuterie.jpg", "Viandes", Colors.red)),
            ],
          ),
        ],
      ),
    );
  }

  Widget gridTile(String img, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: color == null ? Colors.green : color,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/logos/" + img),
            )),
      ),
    );
  }
}
