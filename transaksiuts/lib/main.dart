import 'package:flutter/material.dart';
import 'toko_komputer_screen.dart';

void main() {
  runApp(TokoKomputerApp());
}

class TokoKomputerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TokoKomputerScreen(),
    );
  }
}
