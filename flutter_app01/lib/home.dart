import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
      //4------------------------------------------------------
      child: Column(
        children: [
          const Text('ธัชพล แสงแก้ว',
              style: TextStyle(fontSize: 20, fontFamily: 'tahoma'),
              textAlign: TextAlign.center),
          const SizedBox(height: 8.0),
          Image.asset('assets/images/me.jpg'),
        ],
      ),
      //4------------------------------------------------------
    );
  }
}
