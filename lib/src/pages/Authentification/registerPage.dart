import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/services/auth.dart';
import 'package:ecommerce_app/src/pages/Core/CategorySelection.dart';
import 'package:flutter/material.dart';

import 'AuthSelectionPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String name = '';
  String password = '';
  String phone = '';

  final AuthService _auth = AuthService();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "S'inscrire",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/background/vegetablePattern.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 15),
                        child: TextFormField(
                          onChanged: (val) {
                            name = val;
                          },
                          validator: (val) =>
                              val == "" || val == null
                                  ? null
                                  : "Veuillez saisir un nom valide.",
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Nom'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
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
                          keyboardType: TextInputType.phone,
                          obscureText: true,
                          onChanged: (val) {
                            phone = val;
                          },
                          validator: (val) => (RegExp(r"^[0-9]")
                                      .hasMatch(val) && val.length == 10)
                              ? null
                              : "Veuillez saisir un numéro de téléphone correcte.",
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(Icons.phone),
                              hintText: 'Téléphone'),
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
                  SizedBox(
                    height: 20,
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
                          onPressed: _register,
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
    );
  }

  _register() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      dynamic result =
          await _auth.registerWithEmailAndPassword(email, password,name,phone);
      if (result == null) {
        setState(() {
        loading = false;
      });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Une erreur a eu lieu."),
              );
            });
      } else {
        setState(() {
        loading = false;
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CategorySelection()));
      }

      
    }

    print(name);
    print(email);
    print(password);
  }
}
