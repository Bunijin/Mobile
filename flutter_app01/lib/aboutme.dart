import 'package:flutter/material.dart';

class Aboutme extends StatelessWidget {
  const Aboutme({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
      child: Column(
        children: [
          Text('สาขาวิชา : คอมพิวเตอร์',
              style: TextStyle(fontSize: 20, fontFamily: 'tahoma'),
              textAlign: TextAlign.center),
          Text('คณะ : วิศวกรรมศาสตร์',
              style: TextStyle(fontSize: 20, fontFamily: 'tahoma'),
              textAlign: TextAlign.center),
          Text('GPA : 3.4',
              style: TextStyle(fontSize: 20, fontFamily: 'tahoma'),
              textAlign: TextAlign.center),
          
        ],
      ),
    );
  }
}
