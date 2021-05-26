import 'package:cotrack_app/firebase/authenticate.dart';
import 'package:cotrack_app/firebase/database.dart';
import 'package:cotrack_app/login.dart';
import 'package:cotrack_app/profile.dart';
import 'package:flutter/material.dart';

var colPrim = Color(0xffff5757);
var colAcc = Color(0xffffbd59);
var colHint = Color(0xaaffffff);

FireAuth auth = FireAuth();
FireDB db = FireDB(auth.getUID());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CoTrack Home",
      home: HomePageState(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: colPrim,
        textTheme: TextTheme(bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        // accentColor: colAcc,
        // hintColor: colHint,
        unselectedWidgetColor: colAcc,
        // radioTheme: RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) => colAcc)),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity,50))),
        inputDecorationTheme: InputDecorationTheme(
          // labelStyle: TextStyle(color: Color(0xffffffff)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colAcc, width: 3.0)),
          border: OutlineInputBorder(),
          // filled: true,
          // fillColor: Color(0x22ffbd59)
        )
      )
    );
  }
}

class HomePageState extends StatefulWidget {
  @override
  _HomePageStateState createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: Row(children: [
          Text("Scan a code "),
          Icon(Icons.double_arrow_rounded),
          FloatingActionButton(onPressed: (){}, backgroundColor: colPrim, child: Icon(Icons.qr_code_scanner)),
        ], mainAxisAlignment: MainAxisAlignment.end),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            DrawerHeader(child: Image.asset('images/logo.png'), decoration: BoxDecoration(color: colPrim)),
            ListTile(leading: Icon(Icons.dashboard), title: Text("Dashboard"), selected: true),
            Divider(color: Colors.black, endIndent: 20, indent: 20),
            ListTile(leading: Icon(Icons.person), title: Text("Profile"), onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
            },),
            ListTile(leading: Icon(Icons.receipt_long_rounded), title: Text("Visiting Log")),
            Divider(color: Colors.black, endIndent: 20, indent: 20),
            ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
            ListTile(leading: Icon(Icons.feedback_outlined), title: Text("Feedback")),
            Divider(color: Colors.black, endIndent: 20, indent: 20),
            ListTile(leading: Icon(Icons.logout), title: Text("Sign Out"), onTap: (){
              auth.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
            },),
          ],),
        ),
        appBar: AppBar(
          title: Image.asset('images/icon.png', width: 50),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              auth.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
            }, icon: Tooltip(message: "Logout", child: Icon(Icons.logout))),
            IconButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
            }, icon: Tooltip(message: "View Profie", child: Icon(Icons.person)))
            ],
        )
      )
    );
  }
}