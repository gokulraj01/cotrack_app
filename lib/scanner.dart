import 'package:cotrack_app/home.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

var colPrim = Color(0xffff5757);
var colAcc = Color(0xffffbd59);
var colHint = Color(0xaaffffff);

class QRScan extends StatefulWidget {
  @override
  _QRScanState createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('images/icon.png', width: 50),
          centerTitle: true,
        ),
        body: _buildQrView(context),
    );
  }

  Widget _buildQrView(BuildContext ctx) {
      // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
      var scanArea = (MediaQuery.of(ctx).size.width < 400 ||
              MediaQuery.of(ctx).size.height < 400)
          ? 150.0
          : 300.0;
      // To ensure the Scanner view is properly sizes after rotation
      // we need to listen for Flutter SizeChanged notification and update controller
      return QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea),
      );
    }

    void _onQRViewCreated(QRViewController controller) {
      setState(() {
        this.controller = controller;
      });
      controller.scannedDataStream.listen((scanData) {
        setState(() {
          result = scanData;
          Navigator.of(context).pop(result);
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        });
      });
    }
}