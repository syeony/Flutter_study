import 'package:flutter/material.dart';

class MemoDetail extends StatelessWidget {
  String memo="";
  int index = -1;
  MemoDetail(this.memo, this.index);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Memo Detail'),
      ),
      body: Container(
        child: Center(
          child: Text(memo , style: TextStyle(fontSize: 30),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(index);
        },
        child: Icon(Icons.restore_from_trash_outlined),
      ),
    );
  }
}
