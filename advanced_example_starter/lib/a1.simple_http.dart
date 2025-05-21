import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Http Test'
        ),
      ),
      body: Container(
        child:SingleChildScrollView(
          child: Text('$result'),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var url = Uri.parse('https://www.ssafy.com/');
          var response = await http.get(url);
          debugPrint(response.toString());
          setState(() {
            result = utf8.decode(response.bodyBytes);
          });
        },
        child: Icon(Icons.download),
      ),
    );
  }
}
