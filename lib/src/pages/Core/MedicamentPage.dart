import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/services/cartService.dart';
import 'package:ecommerce_app/services/productService.dart';
import 'package:ecommerce_app/src/pages/Core/CartPage.dart';
import 'package:ecommerce_app/src/widgets/products/productList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MedicamentPage extends StatefulWidget {
  @override
  _MedicamentPageState createState() => _MedicamentPageState();
}

class _MedicamentPageState extends State<MedicamentPage> {
  @override
  Widget build(BuildContext context) {
  User user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                detailProduct(user.uid);
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Icon(Icons.shopping_basket)),
        ],
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Médicaments"),
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
        ProductList(
          category: "medicine",
        )
      ]),
    );
  }

  Future<void> detailProduct(String uid) async {
    String name;
    String description;

  final _formKey = GlobalKey<FormState>();
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ajout d'un produit"),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val) {
                      name = val;
                    },
                    validator: (val) =>
                        val.length >0
                            ? null
                            : "Veuillez saisir le nom du produit.",
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintText: 'Nom du produit'),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val) {
                      description = val;
                    },
                    validator: (val) =>
                        val.length > 0
                            ? null
                            : "Veuillez saisir une description valide.",
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintText: 'Description'),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              color: Colors.green,
              child: Text(
                'Ajouter',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()){
                  String id = await ProductService().addProduct(name);
                  CartService(uid: uid).addProductToCart(new Product(id: id, name: name ));
                Navigator.of(context).pop();

                }

              },
            ),
            FlatButton(
              child: Text(
                'Annuler',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
