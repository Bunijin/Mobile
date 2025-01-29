import 'package:flutter/material.dart';
import 'package:flutter_app01/aboutme.dart';
import 'package:flutter_app01/home.dart';
import 'package:flutter_app01/hobby.dart';
import 'package:flutter_app01/contact.dart';
import 'package:flutter_app01/interest.dart';
void main() => runApp(const MyApp());

//1------------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //2----------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tuchpol Saengkaew'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home, color: Colors.brown),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.school, color: Colors.green),
                text: 'About me',
              ),
              Tab(
                icon: Icon(Icons.lightbulb, color: Colors.orange),
                text: 'Interest',
              ),
              Tab(
                icon: Icon(Icons.bookmark, color: Colors.blue),
                text: 'Hobby',
              ),
              Tab(
                icon: Icon(Icons.call_end, color: Colors.green),
                text: 'Contact',
              ),
            ]),
          ),
          //3--------------------------------------------------
          body: const TabBarView(children: [
            Home(),
            Aboutme(),
            Interest(),
            Hobby(),
            Contact(),
          ]),
          //3--------------------------------------------------
        ),
      ),
    );
  }
  //2----------------------------------------------------------
}
//1------------------------------------------------------------