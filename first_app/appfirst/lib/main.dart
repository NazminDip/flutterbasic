import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    //we use material design start point of app
    debugShowCheckedModeBanner: false,
    title: "First App",
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //head of flutter like roof provide more widget
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: const [
          Icon(Icons.access_alarms),
          Icon(Icons.local_activity),
        ],
        title: const Text("Hi Appbar"),
      ),
      body: Container(
        color: Colors.orange,
        child: const Center(
          child: Text(
            "Hi I am  First App",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
