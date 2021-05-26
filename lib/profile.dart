import 'package:cotrack_app/firebase/authenticate.dart';
import 'package:cotrack_app/firebase/database.dart';
import 'package:flutter/material.dart';

FireAuth auth = FireAuth();
String uid = auth.getUID();

var colPrim = Color(0xffff5757);
var colAcc = Color(0xffffbd59);
var colHint = Color(0xaaffffff);

class Profile extends StatefulWidget {
  @override
  _ProfileStateBody createState() => _ProfileStateBody();
}

class _ProfileStateBody extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('images/icon.png', width: 50),
          centerTitle: true,
        ),
        body: ProfileViewer(),
    );
  }
}

class ProfileViewer extends StatefulWidget {
  @override
  _ProfileViewerState createState() => _ProfileViewerState();
}

class _ProfileViewerState extends State<ProfileViewer> {
  String name = "Manuu";
  @override
   Widget build(BuildContext context) {
      FireDB db = FireDB(uid);
      // dynamic data = db.getData().then((d){
      //     var data = d.data();
      //     name = data['name'];
      //     phone = data['phone'];
      //     email = data['email'];
      //     type = data['uType'];
      //     print(name);
      //   });
      return ListBuilder();
  }
}

class ListBuilder extends StatefulWidget {
  @override
  _ListBuilderState createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    String name = '', phone = '', email = '', type = '';
    return ListView(
      children:[
        SizedBox(height:20),
        Center(child: Text("Your Profile", style: TextStyle(fontSize: 30))),
        Center(child: Icon(Icons.person_pin_outlined, size: 150)),
        Card(child: Padding(padding: EdgeInsets.all(20), child: Text(name)), margin: EdgeInsets.all(10)),
        Card(child: Padding(padding: EdgeInsets.all(20), child: Text(phone)), margin: EdgeInsets.all(10)),
        Card(child: Padding(padding: EdgeInsets.all(20), child: Text(email)), margin: EdgeInsets.all(10)),
        Card(child: Padding(padding: EdgeInsets.all(20), child: Text(type)), margin: EdgeInsets.all(10)),
        ElevatedButton(onPressed: (){}, child: Text("Update"))
      ]
    );
  }
}