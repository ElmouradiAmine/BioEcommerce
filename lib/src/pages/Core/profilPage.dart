import 'package:ecommerce_app/models/userData.dart';
import 'package:ecommerce_app/services/auth.dart';
import 'package:ecommerce_app/services/userService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String name = '';
  String phone = '';
  String adress = '';

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    UserData user = Provider.of<UserData>(context);
    email = user.email;
    name = user.name;
    phone = user.phone;
    adress = user.adress;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "images/background/vegetablePattern.jpg",
            ),
            fit: BoxFit.fitHeight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            "Mon profil",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Form(
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
                          initialValue: user.name,
                          onChanged: (val) {
                            name = val;
                          },
                          /*validator: (val) =>
                              (val == "" || val == null)
                                  ? null
                                  : "Veuillez saisir un nom valide.",*/ //TODO: FIX THIS BUG
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
                          initialValue: user.email,
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
                          initialValue: user.phone,
                          keyboardType: TextInputType.phone,
                          onChanged: (val) {
                            phone = val;
                          },
                          validator: (val) => (RegExp(r"^[0-9]+$")
                                      .hasMatch(val) &&
                                  val.length == 10)
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
                          initialValue: user.adress,
                          onChanged: (val) {
                            adress = val;
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(Icons.map),
                              hintText: 'Adresse'),
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
                          onPressed: () {
                            updateUserData(user.uid);
                          },
                          child: Text(
                            "Mettre à jour",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
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
      ),
    );
  }

  updateUserData(String uid) async {
    FocusScope.of(context).unfocus();
    print(email);
    print(name);
    print(phone);
    print(adress);
    if (_formKey.currentState.validate()) {
      setState(() {
        loading = true;
      });

      try {
        await UserService(uid: uid)
            .updateUserDataWithAdress(email, name, phone, adress);
            AuthService().updateUserEmail(email);
        setState(() {
          loading = false;
        });
        showDialog(
          barrierDismissible: true,
            context: context,
            builder: (context) {
              return AlertDialog(
                
                content: Text("Votre profil a été mise à jour avec succès."),
                actions: <Widget>[
                  FlatButton(
                    color: Colors.green,
                    child: Text("Ok", style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      } catch (e) {
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
      }
    }
  }
}
