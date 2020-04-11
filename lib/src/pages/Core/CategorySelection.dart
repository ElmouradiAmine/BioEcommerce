import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/userData.dart';
import 'package:ecommerce_app/services/auth.dart';
import 'package:ecommerce_app/src/pages/Authentification/AuthSelectionPage.dart';
import 'package:ecommerce_app/src/pages/Core/AutrePage.dart';
import 'package:ecommerce_app/src/pages/Core/CartPage.dart';
import 'package:ecommerce_app/src/pages/Core/FruitsPage.dart';
import 'package:ecommerce_app/src/pages/Core/LegumesPage.dart';
import 'package:ecommerce_app/src/pages/Core/MedicamentPage.dart';
import 'package:ecommerce_app/src/pages/Core/ViandePage.dart';
import 'package:ecommerce_app/src/pages/Core/commandesPage.dart';
import 'package:ecommerce_app/src/pages/Core/profilPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorySelection extends StatefulWidget {
  @override
  _CategorySelectionState createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  AuthService _auth = AuthService();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);
    if (userData == null) return Container(
      color: Colors.white,
    );
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            DrawerHeader(
              
              decoration: BoxDecoration(
                color: Colors.green),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                children: <Widget>[
                  Icon(Icons.account_circle, size: 50,color: Colors.white,),
                  SizedBox(height: 5,),
                  Text(userData.name, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.mail, color: Colors.white, size: 15,),
                      SizedBox(width: 5,),
                      Text(userData.email, style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.phone, color: Colors.white, size: 15,),
                      SizedBox(width: 5,),
                      Text(userData.phone, style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ],
            ),
              )),
            ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilPage()));
              },
              leading: Icon(Icons.person,color: Colors.green,),
              title: Text("Mon Profil"),

            ),
            Divider(indent: 10, endIndent: 10),
            ListTile(
              onTap: (){
      
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return CartPage();
                }));
              },
              leading: Icon(Icons.shopping_basket, color: Colors.orange,),
              title: Text("Mon Panier",),
              
            ),
            Divider(indent: 10, endIndent: 10),

            ListTile(
              onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommandesPage()));
              },
              leading: Icon(Icons.list, color: Colors.blue),
              title: Text("Mes commandes"),
              
            ),
            Divider(indent: 10, endIndent: 10),

            ListTile(
              onTap: (){},
              leading: Icon(Icons.info, color: Colors.blueGrey,),
              title: Text("À propos"),
              
            ),
                        Divider(indent: 10, endIndent: 10),

            ListTile(
              onTap: (){},
              leading: Icon(Icons.library_add, color: Colors.brown),
              title: Text("En savoir plus"),
              
            ),
            Divider(),
            ListTile(
              onTap: _signOut,
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text("Se déconnecter"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Icon(Icons.shopping_basket))
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
              
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MedicamentPage()));
                  },
                  child: gridTile("medicaments.jpg", "Médicaments", Colors.blue)),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ViandePage()));
                  },
                  child: gridTile("charcuterie.jpg", "Viandes", Colors.red)),
                  GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AutrePage()));
                  },
                  child:gridTile("cereale.jpg", "Autres", Colors.brown)),
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

  _signOut() async {
    await _auth.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AuthSelectionPage()));
  }
}
