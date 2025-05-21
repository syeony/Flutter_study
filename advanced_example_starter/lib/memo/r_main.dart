import 'package:advanced_example/memo/r_memo_detail.dart';
import 'package:advanced_example/memo/r_memo_edit.dart';
import 'package:advanced_example/memo/r_memo_list.dart';
import 'package:flutter/material.dart';

// Route를 이용한 구현..
void main() {
  runApp(MyAppRoute());
}

class MyAppRoute extends StatelessWidget {
  static const String _title = 'memo_route';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MemoListRoute(),
        '/edit' : (context) => MemoEditRoute(),
        '/detail' : (context) => MemoDetailRoute(),
      },
    );
  }
}
