import 'package:flutter/material.dart';

class Hobby extends StatelessWidget {
  const Hobby({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
      child: Column(
        children: [
          const Text('Manga',
              style: TextStyle(fontSize: 20, fontFamily: 'tahoma'),
              textAlign: TextAlign.center),
          const SizedBox(height: 8.0),
          Image.asset('assets/images/hobby_manga.jpg'),
        ],
      ),
    );
  }
}
