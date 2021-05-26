import 'package:cloud_firestore/cloud_firestore.dart';

class FireDB{
  String uid;
  FireDB(this.uid);
  Future store(String name, String email, String phone, String uType) async {
    try{
      FirebaseFirestore db = FirebaseFirestore.instance;
      CollectionReference users = db.collection('users');
      await users.doc(uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'uType': uType
      });
      return true;
    } catch(e){
        print(e);
        return false;
    }
  }

  Future getData() async {
    try{
      FirebaseFirestore db = FirebaseFirestore.instance;
      CollectionReference users = db.collection('users');
      DocumentSnapshot d =  await users.doc(uid).get();
      return d;
    } catch(e){
        print(e);
        return false;
    }
  }
}