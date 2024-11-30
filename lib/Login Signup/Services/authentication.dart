import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //for storing data in cloud firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // for  authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;


//import package cloud firestore and firebase auth on system
//for signup
Future<String> signUpUser(
    {required String email,
    required String password,
    required String name}) async {
  String res = " Some error occured";
  try {
    // for registering user in firebase with  email and password
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    // for adding user to cloud firestore
    await _firestore.collection("users").doc(credential.user!.uid).set({
      'name': name,
      "email": email,
      'uid': credential.user!.uid,    
      //we can't store user password in cloud firestore
    });
    res = "success";
  } catch (e) {
    print(e.toString());
  }
  return res;
}
}
//signup