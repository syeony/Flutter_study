import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'db_memo.dart';

class MemoListRouteDB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemoListRouteDB();
}

class _MemoListRouteDB extends State<MemoListRouteDB> {
  late List<Memo> todoList = [];

  // 헬퍼 클래스 초기화.
  final MemoHelper helper = MemoHelper();

  @override
  void initState() {
    super.initState();
    helper.getAllMemo().then((value) => todoList = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('routeMy Memo_route'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              todoList[index].title,
              style: TextStyle(fontSize: 25, color: Colors.blueAccent),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: todoList[index]);
            },
          );
        },
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNavigation(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNavigation(BuildContext context) async {
    // async로 동작하므로, 대기했다가 결과를 받아서 처리해야 함.
    final result = (await Navigator.pushNamed(context, '/edit')) as List<String>;
    await helper.add(Memo(id:0, title:result[0], contents: result[1]));

    var todo = await helper.getAllMemo();

    setState(()  {
      todoList = todo;
    });
  }
}
