import 'package:flutter/material.dart';

import 'db_memo.dart';


class MemoEditRouteDB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = new TextEditingController();
    TextEditingController controller2 = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Memo 추가하기_route'),
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                      width : 70,
                      child:Text("Title : ")),
                  Flexible(
                    child:TextField(
                      controller: controller1,
                      keyboardType: TextInputType.text,
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
                    child:TextField(
                      controller: controller2,
                      keyboardType: TextInputType.text,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop([controller1.value.text, controller2.value.text]);
                },
                child: Text('Memo 저장하기'),
              ),
            ],
          ),
        ),
    );
  }
}
