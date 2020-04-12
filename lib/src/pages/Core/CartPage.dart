import 'package:ecommerce_app/models/CartProduct.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/services/orderService.dart';
import 'package:ecommerce_app/src/pages/Core/commandesPage.dart';
import 'package:ecommerce_app/src/widgets/cart/cartList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool loading = false;
  int choice1;
  @override
  Widget build(BuildContext context) {
    List<CartProduct> cartProducts =
        Provider.of<List<CartProduct>>(context) ?? [];
    User user = Provider.of<User>(context);

    int calculatePoid() {
      int total = 0;
      for (var cartProduct in cartProducts) {
        total += cartProduct.qte;
      }
      return total;
    }

    Future<void> validerCommandePopup() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Valider commande'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Êtes-vous sûr de vouloir valider votre commande ?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.green,
                child: Text(
                  'Oui',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  choice1 = 0;
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                color: Colors.grey,
                child: Text(
                  'Annuler',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  choice1 = 1;
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> successCommande() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Votre commande a été validé avec succès!'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.green,
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.white,
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

    Future<void> echecCommande() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Une erreur lors de la validation de votre commande a eu lieu. Veuillez réessayer plus tard.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.green,
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.white,
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

    Future<void> exceeded() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Vous avez dépassé la capacité recommandée.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.green,
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.white,
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

    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back)),
            title: Text("Mon Panier"),
            actions: <Widget>[],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/background/vegetablePattern.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(child: CartList()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                      color: calculatePoid() <= 10 ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Nombre d'articles : ${cartProducts != null ? cartProducts.length : 0}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "Poids : " + calculatePoid().toString() + " Kg",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.orange,
                  child: InkWell(
                    onTap: () async {
                      if (calculatePoid() <= 10) {
                        if ((cartProducts != null ? cartProducts.length : 0) !=
                            0) {
                          await validerCommandePopup();
                          if (choice1 == 0) {
                            setState(() {
                              loading = true;
                            });
                            bool success = await OrderService(uid: user.uid)
                                .addOrder(cartProducts);
                            setState(() {
                              loading = false;
                            });
                            if (success) {
                              await successCommande();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return CommandesPage();
                              }));
                            } else {
                              echecCommande();
                            }
                          }
                        }
                      } else {
                        exceeded();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0),
                      child: Text(
                        "Valider ma commande",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: loading,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.7),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        )
      ],
    );
  }
}
