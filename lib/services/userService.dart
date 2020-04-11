import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/userData.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UserService {
  final String uid;
  UserService({this.uid});
  //collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(String email, String name, String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double lat = (prefs.getDouble('lat') ?? 0) ;
    double long = (prefs.getDouble('long') ?? 0) ;
    return await userCollection.document(uid).setData({
      "uid": uid,
      "email": email,
      "name": name,
      "phone": phone,
      "lat": lat,
      "long": long,
    }); 
  }
  Future updateUserDataWithAdress(String email, String name, String phone, String adress) async {
    return await userCollection.document(uid).setData({
      "uid": uid,
      "email": email,
      "name": name,
      "phone": phone,
      "adress": adress,

    }); 
  }

  Stream<UserData> getUserData()  {
    return userCollection.document(uid).snapshots().map((document){
      return UserData(uid:uid, email: document.data["email"], name: document.data["name"],phone: document.data["phone"], adress: document.data["adress"] != null ? document.data["adress"] : "");
    });
  }

}