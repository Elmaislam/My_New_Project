import 'package:flutter/material.dart';
import 'converter_page.dart';

void main() {
  runApp(const CurrencyMate());
}

class CurrencyMate extends StatelessWidget {
  const CurrencyMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CurrencyMate',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const ConverterPage(),
    );
  }
}
