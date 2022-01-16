import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Http data call",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "https://jsonplaceholder.typicode.com/photos";
  var data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(Uri.parse(url));
    final alldata = jsonDecode(res.body);

    setState(() {
      data = alldata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Http  data Call")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          // ignore: unnecessary_null_comparison, unrelated_type_equality_checks
          child: data != null
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        // Text(data[index]['albumId']),
                        //Text(data[index]['id']),
                        Text(data[index]['title']),
                        Text(data[index]['thumbnailUrl']),
                        Text(data[index]['url']),
                      ],
                    );
                  },
                  itemCount: data.length,
                )
              : const CircularProgressIndicator(backgroundColor: Colors.red),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
