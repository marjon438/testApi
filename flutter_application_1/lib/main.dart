import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(),
          body: TextButton(
              onPressed: () {
                getFromInternet();
              },
              child: Text('Press me!'))),
    );
  }

  Future getFromInternet() async {
    http.Response answer = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    var obj = jsonDecode(answer.body);
    debugPrint(obj["title"].toString());
  }
}
