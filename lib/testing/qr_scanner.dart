import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main(){
  runApp(QRScan());
}

class QRScan extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QRScanner",
      home: QRScanBody(),
    );
  }
}

class QRScanBody extends StatefulWidget {
  @override
  _QRScanBodyState createState() => _QRScanBodyState();
}

class _QRScanBodyState extends State<QRScanBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}