import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/src/widgets/orders/orderTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class OrderList extends StatelessWidget {
  final List<Order> listOrder;
  OrderList({this.listOrder});
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: listOrder != null ? listOrder.length : 0,
      itemBuilder: (context,index){
        print(listOrder[index].id);
        return OrderTile(order: listOrder[index],index: index+1,);
      },
    );
  }
}
