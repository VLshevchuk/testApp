import 'package:flutter/material.dart';
import 'package:mobile_fathers/pages/page.dart';



void main(){
  runApp(const WorkApp());
}

class WorkApp extends StatelessWidget {
   const WorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
