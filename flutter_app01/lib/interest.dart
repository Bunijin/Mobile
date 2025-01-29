import 'package:flutter/material.dart';

class Interest extends StatelessWidget {
  const Interest({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
      child: Column(
        children: [
          const Text('Backend', style: TextStyle(fontSize: 20.0,fontFamily: 'tahoma'),),
          Image.asset('assets/images/backend.png'),
          const Text('Game Dev', style: TextStyle(fontSize: 20.0,fontFamily: 'tahoma'),),
          Image.asset('assets/images/image.webp'),
        ],
      ),
    );
  }
}