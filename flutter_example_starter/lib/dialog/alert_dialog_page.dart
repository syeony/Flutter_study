import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogPage'),
      ),
      body: ElevatedButton(
        onPressed: () {
          _neverSatisfied();
        },
        child: Text('Alert Dialog'),
      ),
    );
  }

  Future _neverSatisfied() {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('제목'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Alert Dialog 입니다'),
                Text('OK를 눌러 닫습니다'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Todo
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
