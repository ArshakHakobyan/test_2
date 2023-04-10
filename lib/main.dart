import 'package:flutter/material.dart';

import 'package:telcell_copy/pages/add_credit_card.dart';
import 'pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (context) => const HomeScreen(),
        '/credit_cards_page/bindbtn': (context) => const AddCard(),
      },
      initialRoute: '/',
      //home: HomeScreen(),
    );
  }
}
