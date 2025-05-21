import 'package:flutter/material.dart';

class MemoListRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemoListRoute();
}

class _MemoListRoute extends State<MemoListRoute> {
  List<String> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList.add('안드로이드 공부하기');
    todoList.add('윗몸 일으키기 40회');
    todoList.add('한달에 한권 독서하기');
    todoList.add('친구들 만나 운동하기');
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
              todoList[index],
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
    final result = await Navigator.pushNamed(context, '/edit');
    setState(() {
      todoList.add(result.toString());
    });
  }
}
