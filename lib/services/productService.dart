import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/Product.dart';

class ProductService {
  final CollectionReference productCollection =
      Firestore.instance.collection('products');

  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Product(
          id: doc.data["id"] ?? "",
          name: doc.data["name"] ?? "",
          url: doc.data["url"] ?? "",
          category: doc.data["category"] ?? "");
    }).toList();
  }

  Future<String> addProduct(String name) async {
    String docId;
    await productCollection.add({
      "name": name,
      "original": false,
      "url":"https://firebasestorage.googleapis.com/v0/b/bio-ecommerce.appspot.com/o/medicineIcon.png?alt=media&token=bbd78e4a-c56b-43c7-9947-6dbd7c20d3c2",
    }).then((doc) {
      docId = doc.documentID;
      doc.updateData({"id": doc.documentID});
    });

    return docId;
  }

  Future removeProduct(String id) async{
    return await productCollection.document(id).delete();
}

  Stream<List<Product>> get products {
    return productCollection.snapshots().map(_productListFromSnapshot);
  }
}
