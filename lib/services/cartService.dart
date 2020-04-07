import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/CartProduct.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/src/widgets/cart/cartList.dart';

class CartService {
  final String uid;
  CartService({this.uid});
  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future addProductToCart(Product product) async {
    DocumentSnapshot doc = await userCollection.document("$uid").get();
    List<Map> cartList = [];

    if (doc.data["cart"] != null) {
      for (var element in doc.data["cart"]) {
        
        cartList.add({"id": element["id"], "qte": element["qte"] });
      }
    }

    cartList.add({"id": product.id, "qte": 1 });
    return await userCollection.document("$uid").updateData({
      "cart": cartList,
    });
  }

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


  Stream<List<CartProduct>> getCartProduct() {
    return userCollection.document(uid).snapshots().map((doc) {
      List<CartProduct> cartList = [];
      if (doc.data["cart"] != null) {
        for (var element in doc.data["cart"]) {
          cartList.add(CartProduct(qte: element["qte"], idProd: element["id"]));
        }
      }
      return cartList;
    });
  }


  Future removeProduct(String id) async {
  DocumentSnapshot doc = await userCollection.document("$uid").get();
    List<Map> cartList = [];

    if (doc.data["cart"] != null) {
      for (var element in doc.data["cart"]) {
        if (element["id"] != id)
          cartList.add({"id": element["id"], "qte": (element["qte"]) });
        
      }
    }
    return await userCollection.document("$uid").updateData({
      "cart": cartList,
    });
  }

/*
  Stream<UserData> getUserData()  {
    return userCollection.document(uid).snapshots().map((document){
      print("CHECK HERE" + document.data["email"]);
      return UserData(uid:uid, email: document.data["email"], name: document.data["name"]);
    });
  }

  */

  /*
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
