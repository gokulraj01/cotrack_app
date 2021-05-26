import 'package:cotrack_app/firebase/authenticate.dart';
import 'package:cotrack_app/home.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
var colPrim = Color(0xffff5757);
var colAcc = Color(0xffffbd59);
var colHint = Color(0xaaffffff);

FireAuth auth = FireAuth();

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
        errorColor: Colors.yellow,
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity,50))),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Color(0xffffffff), fontSize: 16),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2.0)),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Color(0x22ffbd59)
        )
      ),
    );
  }
}

class LoginController extends StatefulWidget {
  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController>{
  bool _emailVal = false;
  var _emailC = TextEditingController();
  var _passC = TextEditingController();
  bool _passVal = false;
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    String email = '', password = '';
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
            controller: _emailC,
            onChanged: (val){email = val;},
            decoration: InputDecoration(
            labelText: "Email",
            hintText: "Your registered e-mail id",
            errorText: _emailVal ? 'Value Can\'t Be Empty' : null
          )),
          SizedBox(height: 10),
          TextField(
            controller: _passC,
            onChanged: (val){password = val;},
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              errorText: _passVal ? 'Value Can\'t Be Empty' : null
          )),
          SizedBox(height: 10),
          ElevatedButton(onPressed: () async {
              setState(() {
                  _emailC.text.isEmpty ? _emailVal = true : _emailVal = false;
                  _passC.text.isEmpty ? _passVal = true : _passVal = false;
                });
             var state = await auth.signIn(email, password);
             if(state.runtimeType.toString() != "User")
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state)));
              else if(auth.signedIn()){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed")));
              }
          }, child: Text("Sign-In")),
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