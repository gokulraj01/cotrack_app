import 'package:cotrack_app/firebase/authenticate.dart';
import 'package:cotrack_app/home.dart';
import 'package:cotrack_app/login.dart';
import 'package:flutter/material.dart';
var colPrim = Color(0xffff5757);

FireAuth auth = FireAuth();

void main() {
  runApp(Landing());
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CoTrack",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: LandingHome()
    );
  }
}
class LandingHome extends StatefulWidget {
  @override
  _LandingHomeState createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {
  @override
  Widget build(BuildContext context) {
    Future fireInit = auth.init();
    fireInit.then((v) async{
      if(auth.signedIn())
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      else
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    });
    return Scaffold(
      backgroundColor: colPrim,
      body: Center(child: Column(children:[
        // Image.asset('images/logo.png', width: 300),
        CircularProgressIndicator(),
        Text("Loading"),
      ], mainAxisAlignment: MainAxisAlignment.center,)
      ),
    );
  }
}