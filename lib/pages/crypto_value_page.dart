import 'package:flutter/material.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('"CryptoPage"'),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Text('CryptoPage'),
      ),
    );
  }
}
