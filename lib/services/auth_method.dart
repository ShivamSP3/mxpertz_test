import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../Model/user.dart' as model;

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // Future<model.User> getUserDetails()async{
  //     User currentUser = _auth.currentUser!;
  //     DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();
  //     return model.User.fromSnap(snap);
  // }
  // Sign Up the user
  Future<String> signUpUser ({
    required String email,
    required String username,
    required String password,
  })async{
        String res = 'Some error Occured';
        try {
          if (email.isNotEmpty ||username.isNotEmpty ||password.isNotEmpty  ) {
            // Register User in Firebase
          UserCredential cred = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
          print(cred);

    
          // Add user to database
             
           model.User user = model.User(
            email:username,
            uid:cred.user!.uid,
            username:email,
            );

         await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
           res = 'Success';
           print(res);
          } 
        } catch (e) {
          res = e.toString();
        }
        return res;
  }
  // Logging user
  Future<String> loginUser({
    required String email,
    required String password})async{
    String res = 'Some Error Occured';

    try {
      if (email.isNotEmpty  || password.isNotEmpty) {
       await _auth.signInWithEmailAndPassword(email: email, password: password);
       res ='Success';
      }else{
        res = 'Please enter all the fields';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
  // Sign Out user
  Future<void> signOut()async{
    await _auth.signOut();
  }
}