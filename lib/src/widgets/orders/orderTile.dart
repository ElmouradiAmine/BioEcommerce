import 'package:ecommerce_app/models/CartProduct.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/services/orderService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderTile extends StatefulWidget {
  final Order order;
  final int index;

  OrderTile({this.order, @required this.index});

  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  int choice;
  @override
  Widget build(BuildContext context) {
    
  List<CartProduct> listProduct = widget.order.listProduct;
  User user = Provider.of<User>(context);
  List<Product> products = Provider.of<List<Product>>(context).where((product){
      for (CartProduct cartProduct in listProduct){
        if (product.id == cartProduct.idProd) return true;
      }
      return false;
    }
    ).toList();

    
  List<Widget> listProductWidget = widget.order.listProduct.map((cartProduct){
    String productName;
    productName = products.singleWhere((product) => cartProduct.idProd== product.id).name;
    return Text("$productName x ${cartProduct.qte} kg${cartProduct.qte > 1 ? "s": ""}");
  }).toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Commande n°${widget.index}", style: TextStyle(
                  fontSize: 21, fontWeight: FontWeight.bold,
                ),)
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Text("Date: ", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(widget.order.date != null ? widget.order.date : ""),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Nombre de produits: ", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(listProduct!= null ? listProduct.length.toString() : "0" ),
              ],
            ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listProductWidget,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Status: ", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(widget.order.etat != null ? widget.order.etat : "", style: TextStyle(
                      color: Colors.orange,),),
                  ],
                ),
                RaisedButton(
                  onPressed: () async {
                    await annulerCommande(context);
                    if ( choice == 0)
                      OrderService(uid: user.uid).removeOrder(widget.order);
                  },
                  color: Colors.red,
                  child: Text("Annuler", style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<int>  annulerCommande(context) async {
  return showDialog(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Êtes- vous sûr de vouloir annuler cette commande ?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            color: Colors.red,
            child: Text('Oui', style: TextStyle(
              color: Colors.white,
            ),),
            onPressed: () {
              choice =0;
              Navigator.of(context).pop(0);
            },
          ),
          FlatButton(
            child: Text('Non', style: TextStyle(
              color: Colors.black,
            ),),
            onPressed: () {
              choice = 1;
              Navigator.of(context).pop(1);
            },
          ),
        ],
      );
    },
  );
}
}
