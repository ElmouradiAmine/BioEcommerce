import 'package:ecommerce_app/services/auth.dart';
import 'package:ecommerce_app/src/pages/Authentification/AuthSelectionPage.dart';
import 'package:ecommerce_app/src/pages/Core/CategorySelection.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  final AuthService _auth = AuthService();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/background/vegetablePattern.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AuthSelectionPage()));
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            "S'identifier",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 15),
                        child: TextFormField(
                          onChanged: (val) {
                            email = val;
                          },
                          validator: (val) =>
                              RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val)
                                  ? null
                                  : "Veuillez saisir un email valide.",
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              hintText: 'E-mail'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 15),
                        child: TextFormField(
                          obscureText: true,
                          onChanged: (val) {
                            password = val;
                          },
                          validator: (val) => val.length >= 6
                              ? null
                              : "Veuillez saisir un mot de passe plus long (6 caractères minimum).",
                          decoration: InputDecoration(
                            
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Mot de passe'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 24),
                        child: RaisedButton(
                          color: Colors.orange,
                          padding: EdgeInsets.all(16.0),
                          onPressed:_login,
                          child: Text(
                            "S'IDENTIFIER",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
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
            Visibility(
              visible: loading,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.5),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _login() async {
  FocusScope.of(context).unfocus();
  if (_formKey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      dynamic result =
          await _auth.signInWithEmailAndPassword(email, password);
      if (result == null) {
        setState(() {
        loading = false;
      });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Email ou mot de passe incorrecte."),
                actions: <Widget>[
                  FlatButton(
                    color: Colors.green,
                    child: Text("Ok",style: TextStyle(
                      color: Colors.white,

                    ),),
                    onPressed: (){
                    Navigator.of(context).pop();
                  },)
                ],
              );
            });
      } else {
        setState(() {
        loading = false;
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CategorySelection()));
      }

      
    }
    //print(email);
    //print(password);
  }
}
