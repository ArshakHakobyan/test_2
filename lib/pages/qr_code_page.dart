import 'package:flutter/material.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('"QrCodePage"'),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Text('QrCodePage'),
      ),
    );
  }
}
