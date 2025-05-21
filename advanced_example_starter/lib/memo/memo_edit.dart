import 'package:flutter/material.dart';


class MemoEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Memo 추가하기'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(controller.value.text);
                },
                child: Text('Memo 저장하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
