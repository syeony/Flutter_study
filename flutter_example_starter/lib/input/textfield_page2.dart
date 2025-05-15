import 'package:flutter/material.dart';

class TextFieldPage2 extends StatefulWidget {
  const TextFieldPage2({Key? key}) : super(key: key);

  @override
  _TextFieldPage2State createState() => _TextFieldPage2State();
}

class _TextFieldPage2State extends State<TextFieldPage2> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: '여기에 입력하세요',   // 힌트
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),   // 외각선
                  labelText: '여기에 입력하세요',
                ),
              ),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
