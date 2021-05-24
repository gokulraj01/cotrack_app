import 'package:flutter/material.dart';
import 'signup.dart';
var colPrim = Color(0xffff5757);
var colAcc = Color(0xffffbd59);
var colHint = Color(0xaaffffff);
void main(){
  runApp(Login());
}

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginController(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: colPrim,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        accentColor: colAcc,
        hintColor: colHint,
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity,50))),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Color(0xffffffff), fontSize: 16),
          focusedBorder: OutlineInputBorder(),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Color(0x22ffbd59)
        )
      ),
    );
  }
}

class LoginController extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    double logosize = 512;
    if(sh*0.5 < 512){
      logosize = sh*0.5;
    }
    return Scaffold(
      backgroundColor: colPrim,
      body: Center(child: Padding(padding: EdgeInsets.symmetric(horizontal: 0.125*sw),
      child: ListView(
        children: [
          Image.asset('images/logo.png', height: logosize, width: logosize),
          Center(child:Text("Login to your CoTrack Account")),
          SizedBox(height: 20),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
            labelText: "Username",
            hintText: "Enter your username"
          )),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(color: Colors.white),
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
          )),
          SizedBox(height: 10),
          ElevatedButton(onPressed: (){}, child: Text("Sign-In")),
          SizedBox(height: 10),
          Divider(color: colAcc, thickness: 1, endIndent: 20, indent: 20),
          Row(children: [
            Text("Don't have an account?"),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
            }, child: Text("Sign Up"))
          ], mainAxisAlignment: MainAxisAlignment.center,)
        ],
      )
      ))
    );
  }
}