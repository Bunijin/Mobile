import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(ListView03());

class ListView03 extends StatelessWidget {
  const ListView03({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var rnd = Random();
  var leadingIcons = [
    Icons.start,
    Icons.favorite,
    Icons.wifi,
    Icons.phone,
    Icons.settings
  ];
  var titleText = ['Start', 'Heart', 'Wi-Fi', 'Phone', 'Gear'];
  var _switchWifi = true;
  var _switchBluetooth = false;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
          title: const Text('ListView03'),
        ),
    body: ListView.separated(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) => buildListItem(context, index),
          separatorBuilder: (context, index) => Divider(
            thickness: 1,
            color: Colors.blueGrey,
            indent: 10,
            endIndent: 10,
          ),
          itemCount: titleText.length,
          ),
  );

  Widget buildListItem(BuildContext ctx, int index) => ListTile(
    leading: Icon(leadingIcons[i], size: 36,),
    title: Text(titleText[i], textScaleFactor: 1.5,),
    subtitle: Text('\$${10+rnd.nextInt(50)}',textScaleFactor: 1.2,),
    trailing: const Icon(Icons.arrow_forward_ios,),
    tileColor: Colors.black12,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 10, vertical: 5,
    ),
    textColor: Colors.blue,
    iconColor: Colors.green,

    onTap: () {
      alert(ctx, 'เปิดดูรายการ ${titleText[index]}');
    },
  );

  Widget trailingWidget(BuildContext ctx, int index) {
    var widgets = <Widget> [
      Icon(Icons.arrow_forward_ios),
      InkWell(
        child: Icon(Icons.shopping_cart),
        onTap: () {
          alert(ctx, 'หยิบ ${titleText[index]}');
        },
      ),
      Switch(
        value: _switchWifi,
        onChanged: (isOn) => setState( () {
          _switchWifi = isOn;
          var t = isOn.toString();
          alert(ctx, '${titleText[index]} : $t');
        }),
      ),
      Switch(
        value: _switchWifi,
        onChanged: (isOn) => setState( () {
          _switchWifi = isOn;
          var t = (isOn) ? 'เปิด': 'ปิด';
          alert(ctx, '${titleText[index]} : $t');
        }),
      ),
      InkWell(
        child: const Icon(Icons.shopping_cart),
        onTap: () {
          alert(ctx, 'หยิบ ${titleText[index]} ใส่รถเข็นแล้ว');
        },
      ),
    ];
  }

  void alert(BuildContext ctx, String msg) => showDialog(
    context: ctx, 
    builder: (ctx) => AlertDialog(
      content: Text(msg, textScaleFactor: 1.3,),
      actions: [
        TextButton(
          child: Text('OK', textScaleFactor: 1.3,),
          onPressed: () => Navigator.of(ctx).pop(),
        )
      ],
    )
  );
}
