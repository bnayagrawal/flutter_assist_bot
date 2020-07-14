import 'package:flutter/material.dart';
import 'package:flutter_assist_bot/page/billy/billy_chat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Billy',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BillyChatPage(),
    );
  }
}
