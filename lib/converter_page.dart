import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();
  String? errorText;

  void convert() {
    final text = textEditingController.text;
    if (text.isEmpty) {
      errorText = 'Please enter an amount';
    } else {
      errorText = null;
      result = double.tryParse(text) != null ? double.parse(text) * 122.23 : 0;
    }
    setState(() {});
  }

  void reset() {
    textEditingController.clear();
    result = 0;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.teal, width: 2),
      borderRadius: BorderRadius.circular(30),
    );

    final textStyle = const TextStyle(
      color: Colors.teal,
      fontSize: 23,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('CurrencyMate'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 8,
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Image.asset('assets/currency.png', height: 200, width: 200),
                  const Text(
                    'Convert USD to BDT',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  TextField(
                    controller: textEditingController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      hintText: "Enter USD amount",
                      errorText: errorText,
                      prefixIcon: const Icon(
                        Icons.attach_money,
                        color: Colors.teal,
                      ),
                      focusedBorder: border,
                      enabledBorder: border,
                      errorBorder: border,
                      focusedErrorBorder: border,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: convert,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Convert"),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: reset,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.teal,
                      side: const BorderSide(color: Colors.teal),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Reset"),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'BDT ${result.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
