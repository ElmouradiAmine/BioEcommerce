import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/src/widgets/orders/orderList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CommandesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Order> listOrder = Provider.of<List<Order>>(context);
    return Container(
      decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "images/background/vegetablePattern.jpg",
                ),
                fit: BoxFit.cover),
          ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Mes commandes"),),
        body: OrderList(listOrder: listOrder,)),
    );
  }
}