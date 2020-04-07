import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/Product.dart';


class ProductService {



  final CollectionReference productCollection = Firestore.instance.collection('products');

    List<Product> _productListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Product( 
        id: doc.data["id"] ?? "",
        name: doc.data["name"] ?? "",
        url: doc.data["url"] ?? "",
        category: doc.data["category"] ?? ""

      );
    }).toList();
  }

  Stream<List<Product> > get products {
    return productCollection.snapshots().map(_productListFromSnapshot);
  }

}