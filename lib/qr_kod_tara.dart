import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class QrKodTara extends StatefulWidget {
  const QrKodTara({Key? key}) : super(key: key);

  @override
  _QrKodTaraState createState() => _QrKodTaraState();
}

class _QrKodTaraState extends State<QrKodTara> {
  @override
  void initState() {
    super.initState();
    startScanning();
  }

  void startScanning() async {
    await scanQRCode();
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'İPTAL ET',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      if (qrCode == '-1') {
        _showRetryDialog('Tarama iptal edildi');
      } else {
        _showSuccessDialog(qrCode);
      }
    } catch (ex) {
      _showRetryDialog('QR kod tarama işleminiz başarısızdır, lütfen tekrar deneyiniz');
    }
  }

  void _showRetryDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Tekrar Tara', style: TextStyle(color: Colors.green, fontSize: 16)),
              onPressed: () {
                Navigator.of(context).pop();
                startScanning();
              },
            ),
            TextButton(
              child: const Text('Kapat', style: TextStyle(color: Colors.green, fontSize: 16)),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String qrCode) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tarama Başarılı'),
          content: SelectableLinkify(
            onOpen: (link) async {
              final url = Uri.parse(link.url);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw ' $link';
              }
            },
            text: qrCode,
            style:const TextStyle(color: Colors.black),
            linkStyle:const TextStyle(color: Colors.green),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tekrar Tara', style: TextStyle(color: Colors.green, fontSize: 16)),
              onPressed: () {
                Navigator.of(context).pop();
                startScanning();
              },
            ),
            TextButton(
              child: const Text('Kapat', style: TextStyle(color: Colors.green, fontSize: 16)),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
