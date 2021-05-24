import 'package:flutter/material.dart';

var colPrim = Color(0xffff5757);
var colAcc = Color(0xffffbd59);
var colHint = Color(0xaaffffff);

void main() {
  runApp(Appmain());
}

class Appmain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: colPrim,
            title: Row(
              children: [Image.asset('images/icon.png', width: 80)],
              mainAxisAlignment: MainAxisAlignment.center,
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          focusColor: colPrim,
          child: Icon(Icons.qr_code_scanner_sharp),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'CoTrack',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    )),
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
      ),
    );
  }
}
