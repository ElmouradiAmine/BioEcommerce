import 'package:ecommerce_app/models/CartProduct.dart';

class Order {
  final String id;
  final List<CartProduct> listProduct;
  final String etat;
  final String date;

  Order({this.id,this.listProduct, this.etat, this.date});


}