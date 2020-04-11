import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/CartProduct.dart';
import 'package:ecommerce_app/models/order.dart';

import 'cartService.dart';

class OrderService {
  final String uid;
  OrderService({this.uid});
  //collection reference
  final CollectionReference orderCollection =
      Firestore.instance.collection('orders');

  Future addOrder(List<CartProduct> list) async {
    try {
         DocumentSnapshot doc = await orderCollection.document("$uid").get();
    List<Map> orderList = [];
    if (doc.data != null ) {
      print("passed");
      for (var element in doc.data["orders"]) {
        orderList.add({
          "id": element["id"],
          "date": element["date"],
          "status": element["status"],
          "order": element["order"]
        });
      }
    }
      List<Map> listMap = [];
      if (list != null) {
        for (var element in list) {
          listMap.add({"id": element.idProd, "qte": element.qte});
        }
        orderList.add({
          "id": DateTime.now().millisecondsSinceEpoch.toString() + uid,
          "order": listMap,
          "status": "En attente",
          "date": DateTime.now(),
        });
        await orderCollection.document("$uid").setData({
          "orders": orderList,
        });
        await CartService(uid: uid).clearCart();
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

    Stream<List<Order>> getAllOrder()  {
    return orderCollection.document(uid).snapshots().map((doc){
      List<Order> orderList = [];
      if ( doc.data != null){
        for (var order in doc.data["orders"]){
          List<CartProduct> listProduct = [];
          for (var product in order["order"]){
            listProduct.add(CartProduct(idProd: product["id"],qte: product["qte"]));
          }
          
          orderList.add(Order(id: order["id"],etat: order["status"],listProduct: listProduct, date: order["date"].toDate().toString().substring(0,16)));
        }
      }
      return orderList;
    });
  }
  Future removeOrder(Order order) async {
    try {
         DocumentSnapshot doc = await orderCollection.document("$uid").get();
          List<Map> orderList = [];
          if (doc.data != null ) {
            for (var element in doc.data["orders"]) {
              if (element["id"] != order.id){
                orderList.add({
                "id": element["id"],
                "date": element["date"],
                "status": element["status"],
                "order": element["order"]
              });
              }
            }
          }
        await orderCollection.document("$uid").setData({
          "orders": orderList,
        });   
      return true;
    } catch (e) {
      return false;
    }
  }



/*
  Future addQte(Product product) async {
    DocumentSnapshot doc = await userCollection.document("$uid").get();
    List<Map> cartList = [];

    if (doc.data["cart"] != null) {
      for (var element in doc.data["cart"]) {
        if (element["id"] == product.id)
          cartList.add({"id": element["id"], "qte": (element["qte"]+1) });
        else {
          cartList.add({"id": element["id"], "qte": (element["qte"]) });
        }
      }
    }
    return await userCollection.document("$uid").updateData({
      "cart": cartList,
    });
  }
  Future removeQte(Product product) async {
    DocumentSnapshot doc = await userCollection.document("$uid").get();
    List<Map<String,Object>> cartList = [];

    if (doc.data["cart"] != null) {
      for (var element in doc.data["cart"]) {
        if (element["id"] == product.id)
          cartList.add({"id": element["id"], "qte": (element["qte"]-1) });
        else {
          cartList.add({"id": element["id"], "qte": (element["qte"]) });
        }
      }
    }
    return await userCollection.document("$uid").updateData({
      "cart": cartList,
    });
  }


  

  
  Stream<UserData> getUserData()  {
    return userCollection.document(uid).snapshots().map((document){
      print("CHECK HERE" + document.data["email"]);
      return UserData(uid:uid, email: document.data["email"], name: document.data["name"]);
    });
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Brew( 
        name: doc.data["name"] ?? "",
        sugars: doc.data["sugars"] ?? "",
        strenght: doc.data["strenght"] ?? 0,


      );
    }).toList();
  }

  //get brews stream
  Stream<List<Brew> > get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
  */

}
