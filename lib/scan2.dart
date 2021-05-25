//@dart=2.9
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

var colPrim = Color(0xffff5757);
var colAcc = Color(0xffffbd59);
var colHint = Color(0xaaffffff);

void main() {
  runApp(ScanPage());
}

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult = "";
  bool backCamera = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: colPrim,
              title: Row(
                children: [
                  Image.asset('images/icon.png', width: 80),
                  Text("Scan using:" + (backCamera ? "Front Cam" : "Back Cam"))
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: backCamera
                      ? Icon(Ionicons.aperture_outline)
                      : Icon(Icons.camera),
                  onPressed: () {
                    setState(() {
                      backCamera = !backCamera;
                      camera = backCamera ? 1 : -1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(MaterialCommunityIcons.qrcode_scan),
                  onPressed: () {
                    _scan();
                  },
                )
              ],
            ),
            body: Center(
              child: Text(
                (qrCodeResult == null) || (qrCodeResult == "")
                    ? "Please Scan to show some result"
                    : "Result:" + qrCodeResult,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
              ),
            )));
  }

  Future<void> _scan() async {
    ScanResult codeSanner = await BarcodeScanner.scan(
      options: ScanOptions(
        useCamera: camera,
      ),
    );
    setState(() {
      qrCodeResult = codeSanner.rawContent;
    });
  }
}

int camera = 1;
