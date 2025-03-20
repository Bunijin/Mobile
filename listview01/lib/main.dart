import 'package:flutter/material.dart';

void main() => runApp(const ListView01());

class ListView01 extends StatelessWidget {
  const ListView01({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: HomePage(),
  );
}

class HomePage extends StatelessWidget {
  
  var items = ['วันจันทร์', 'วันอังคาร', 'วันพุธ', 'วันพฤหัสบดี', 'วันศุกร์', 'วันเสาร์', 'วันอาทิตย์'];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('ListView01'),),
    body: ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 25,horizontal: 5
      ),
      itemExtent: 80,
      children: listViewChildren(),
    ),
  );

  List<Widget> listViewChildren() => List.generate(items.length, (index) => listItem(items[index]));

  Widget listItem(String text) => Container(
    
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(5),
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, textScaleFactor: 1.5,),
        const Icon(Icons.arrow_forward_ios),
      ],
    ),
  );
}
