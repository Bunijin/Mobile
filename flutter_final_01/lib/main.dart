import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> oddNumbers = [];
    int max = 1000;

    for (int i = 0; i < max; i++) {
      if (i % 2 != 0) {
        oddNumbers.add(i);
      }
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Odd Numbers'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: oddNumbers.map((number) {
                return Text(
                  number.toString(),
                  style: const TextStyle(fontSize: 24),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
