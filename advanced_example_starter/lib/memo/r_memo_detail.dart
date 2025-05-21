import 'package:flutter/material.dart';

class MemoDetailRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Memo Detail_route'),
      ),
      body: Container(
        child: Center(
          child: Text(args.toString() , style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}
