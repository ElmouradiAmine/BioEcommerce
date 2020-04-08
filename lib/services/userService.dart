import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/userData.dart';



class UserService {
  final String uid;
  UserService({this.uid});
  //collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(String email, String name, String phone) async {
    return await userCollection.document(uid).setData({
      "uid": uid,
      "email": email,
      "name": name,
      "phone": phone,
    }); 
  }

  Stream<UserData> getUserData()  {
    return userCollection.document(uid).snapshots().map((document){
      return UserData(uid:uid, email: document.data["email"], name: document.data["name"]);
    });
  }

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