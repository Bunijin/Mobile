import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
      child: Column(
        children: [
          Text(
            'Email: 1165104003447@mail.rmutt.ac.th',
            style: TextStyle(fontSize: 20, fontFamily: 'tahoma'),
              textAlign: TextAlign.center,
          ),
          Text(
            'Tel: 0927533080',
            style: TextStyle(fontSize: 20, fontFamily: 'tahoma'),
              textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
