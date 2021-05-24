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

  Future register(String email, String pass) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signIn(String email, String pass) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: pass
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}