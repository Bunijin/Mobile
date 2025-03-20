import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChangeCalculator(),
    );
  }
}

class ChangeCalculator extends StatefulWidget {
  const ChangeCalculator({super.key});

  @override
  ChangeCalculatorState createState() => ChangeCalculatorState();
}

class ChangeCalculatorState extends State<ChangeCalculator> {
  final TextEditingController totalPriceController = TextEditingController();
  final TextEditingController totalCashController = TextEditingController();
  String result = "";

  void calculateChange() {
    int totalPrice = int.tryParse(totalPriceController.text) ?? 0;
    int totalCash = int.tryParse(totalCashController.text) ?? 0;

    if (totalCash < totalPrice) {
      setState(() {
        result = "Not enough cash!";
      });
      return;
    }

    int totalChange = totalCash - totalPrice;
    int remaining = totalChange;
    Map<int, int> changes = {};
    List<int> money = [500, 100, 50, 20, 10, 5, 2, 1];

    for (int value in money) {
      if (remaining >= value) {
        changes[value] = remaining ~/ value;
        remaining %= value;
      }
    }

    setState(() {
      result = "Change: $totalChange Baht\n";
      changes.forEach((denom, amount) {
        result += "$denom Baht x $amount\n";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: totalPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Total Price"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: totalCashController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Total Cash"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateChange,
                child: const Text("Calculate Change"),
              ),
              const SizedBox(height: 20),
              Text(
                result,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
