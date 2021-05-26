import 'package:cotrack_app/firebase/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FireAuth{
  Future init() async {
    return await Firebase.initializeApp();
  }

  Future signInAnon(ctx) async {
    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInAnonymously();
      final bar = SnackBar(content: Text(userCredential.user!.uid));
      ScaffoldMessenger.of(ctx).showSnackBar(bar);
      return userCredential.user;
    } catch(e){
      print(e);
    }
  }

  Future register(String name, String email, String pass, String phone, String uType) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass
      );
      FireDB db = FireDB(userCredential.user!.uid);
      bool status = await db.store(name, email, phone, uType);
      if(status)
        return userCredential.user;
      else
        return "[Firestore] Database Error";
    } catch (e) {
        print(e);
        return e;
    }
  }

  bool signedIn(){
    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      if(auth.currentUser == null)
        return false;
      else
        return true;
    }
    catch(e){
      return false;
    }
  }

  String getUID(){
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser!.uid;
  }

  Future? signIn(String email, String pass) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: pass
      );
      print(userCredential);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print(e);
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        print(e);
        return 'Wrong password provided for that user.';
      }
    } catch (e){
      print(e);
      return e;
    }
  }
}