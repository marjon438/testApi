import 'dart:convert';
import 'dart:io';

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
    http.Response answer = await http.post(
        Uri.parse(
            'https://todoapp-api.apps.k8s.gu.se/todos?key=ec7ee6eb-8436-4e20-8375-0434bfdcd0ba'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"title": "test"}));
    var obj = jsonDecode(answer.body);
    debugPrint(obj[0]["title"]);
  }
}

// ec7ee6eb-8436-4e20-8375-0434bfdcd0ba
