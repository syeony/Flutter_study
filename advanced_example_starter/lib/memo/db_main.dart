import 'package:flutter/material.dart';

import 'db_memo_detail.dart';
import 'db_memo_edit.dart';
import 'db_memo_list.dart';

// Route를 이용한 구현..
void main() {
  runApp(MyAppRouteDB());
}

class MyAppRouteDB extends StatelessWidget {
  static const String _title = 'memo_route_db';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MemoListRouteDB(),
        '/edit' : (context) => MemoEditRouteDB(),
        '/detail' : (context) => MemoDetailRouteDB(),
      },
    );
  }
}
