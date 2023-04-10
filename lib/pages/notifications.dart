import 'package:flutter/material.dart';
import '../widgets/balance_visibility.dart';

class Notifications extends StatefulWidget {
  const Notifications({key}) : super(key: key);
  @override
  State createState() => NotificationsState();
}

class NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
            title: const BalanceVisibility()),
        body: const Center(
            child: Text(
          'The List Of Notifications is Empty',
          style: TextStyle(
            color: Color.fromRGBO(176, 190, 198, 1),
            fontSize: 17,
          ),
        )));
  }
}
