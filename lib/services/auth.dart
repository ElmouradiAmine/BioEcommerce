import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/services/userService.dart';
import 'package:firebase_auth/firebase_auth.dart';



class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;


  //create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  updateUserEmail(String email){
    _auth.currentUser().then((user){
        user.updateEmail(email);
    });
  }

  //sign in with email and password

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password, String name, String phone) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      await UserService(uid: user.uid).updateUserData(email,name, phone);
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


  // signout
  Future signOut() async{
    try {
      return await _auth.signOut();
      
    } catch(e) {
      print(e);
      return null;
    }
  }


}