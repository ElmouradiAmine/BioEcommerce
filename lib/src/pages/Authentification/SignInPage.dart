import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';

import 'AuthSelectionPage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
             Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => AuthSelectionPage()));
          },
          icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "S'inscrire",
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
            fit: BoxFit.cover
          ),
        ),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal : 24.0,vertical: 15),
                        child: TextField(                      
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Nom'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal : 24.0,vertical: 15),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              hintText: 'E-mail'),
                        ),
                      ),
                      Padding(
                         padding: const EdgeInsets.symmetric(horizontal : 24.0,vertical: 15),
                        child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Password'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal:24),
                        child: RaisedButton(
                          color: Colors.orange,
                          padding: EdgeInsets.all(16.0),
                          onPressed: () {},
                          child: Text(
                            "S'INSCRIRE",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
         
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Déjà inscrit ? "),
                          Text(
                            "S'identifier",
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
    );
  }
}
