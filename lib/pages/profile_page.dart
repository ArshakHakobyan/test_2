import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('"ProfilePage"'),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Text('ProfilePage'),
      ),
    );
  }
}
