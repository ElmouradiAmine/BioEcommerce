import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/src/pages/Authentification/AuthSelectionPage.dart';
import 'package:ecommerce_app/src/pages/Core/CategorySelection.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
             Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => AuthSelectionPage()));
          },
          icon:Icon(Icons.arrow_back)),
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "S'identifier",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/background/vegetablePattern.jpg",
            ),
            fit: BoxFit.fitHeight
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 56.0, horizontal: 24),
          child: ListView(
            
            children: <Widget>[
              Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintText: 'E-mail'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password'),
                  ),
                ],
              ),

              SizedBox(height: 60,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.orange,
                    padding: EdgeInsets.all(16.0),
                    onPressed: (){
             Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => CategorySelection()));
          },
                    child: Text(
                      "S'IDENTIFIER",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Pas de compte ? "),
                      Text(
                        "S'inscrire",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
