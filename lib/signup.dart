import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(AppMain());
}

class AppMain extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'CoTrack',
      theme: ThemeData(
        primaryColor: Colors.indigo[900]),
      home: SignUpBody()
    );
  }
}

class SignUpBody extends StatefulWidget{
  @override
  SignUpBodyState createState() => SignUpBodyState();
}

class SignUpBodyState extends State<SignUpBody>{
  Widget formBuilder(){
    return Padding(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text('Create New Account', style: TextStyle(fontSize: 30),)),
          SizedBox(height: 30),
          TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Name')),
          SizedBox(height: 10),
          TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Email')),
          SizedBox(height: 10),
          TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Phone'), keyboardType: TextInputType.number, inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: (){},
            child: Padding(padding:EdgeInsets.all(15), child: Text("Sign Up")))
        ]),
      padding: EdgeInsets.all(20)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Align(alignment: Alignment.centerLeft, child: Text('CoTrack',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),
          )
          ),
        ),
        ListTile(
          leading: Icon(Icons.question_answer),
          title: Text('Messages'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    ),
  ),
        appBar: AppBar(
          title: Align(alignment: Alignment.centerLeft, child: Text("CoTrack")),
        ),
        body: formBuilder(),
      );
  }
}