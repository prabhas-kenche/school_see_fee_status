import 'package:flutter/material.dart';
import 'fee_status.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fee Status App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeeStatusPage(),
    );
  }
}