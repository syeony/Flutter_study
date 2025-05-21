import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'memo_detail.dart';
import 'memo_edit.dart';

class MemoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemoList();
}

class _MemoList extends State<MemoList> {
  List<String> todoList = [];
  static final String _key = "SHARED_KEY";

  @override
  void initState() {
    super.initState();
    load();
    // if(todoList.length == 0){
    //   todoList.add('안드로이드 공부하기');
    //   todoList.add('윗몸 일으키기 40회');
    //   todoList.add('한달에 한권 독서하기');
    //   todoList.add('친구들 만나 운동하기');
    // }
  }

  saveState({String title="", int index=-1}){
    setState(() {
      if(title != ""){
        todoList.add(title.toString());
      }
      if( index != -1){
        todoList.removeAt(index);
      }
      _savePref();
    });
  }

  void load() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var temp = pref.getStringList(_key);
    if(temp != null){
      todoList = temp;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('My Memo'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              todoList[index],
              style: TextStyle(fontSize: 25, color: Colors.blueAccent),
            ),
            onTap: () async {
              var removeIndex = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MemoDetail(todoList[index], index)));

              if(removeIndex != null && removeIndex >= 0){
                saveState(index: removeIndex);
              }
            },
          );
        },
        itemCount: todoList.length
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
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => MemoEdit()));
    saveState(title:result);
  }

  void _savePref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(_key, todoList);
  }
}
