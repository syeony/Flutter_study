import 'package:flutter/material.dart';

import 'db_memo.dart';

class MemoDetailRouteDB extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Memo args = ModalRoute
        .of(context)!
        .settings
        .arguments as Memo;

    return Scaffold(
      appBar: AppBar(
        title: Text('Memo Detail_route'),
      ),
      body: Container(
        child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        width : 70,
                        child:Text("Title : ",)),
                    Flexible(
                      child:Text(args.title, style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width : 70,
                        child:Text("Contents : ")),
                    Flexible(
                      child:Text(args.contents, style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                      )
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () { Navigator.pop(context); },
                        child:Text("이전")),
                    SizedBox(width: 10,),
                    ElevatedButton(
                        onPressed: () {  },
                        child:Text("수정")),
                    SizedBox(width: 10,),
                    ElevatedButton(
                        onPressed: () {  },
                        child:Text("삭제")),
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }
}
