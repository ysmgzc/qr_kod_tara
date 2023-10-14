import 'package:flutter/material.dart';
import 'package:qr_kod_tara/nfc_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: NfcScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
