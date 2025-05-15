import 'package:flutter/material.dart';

class SafeAreaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lorem ipsum dolor sit amet,",
                style: TextStyle(fontSize: 48),
              ),
              Text("Lorem ipsum dolor sit amet,",
                style: TextStyle(fontSize: 48),
              ),
              Text("Lorem ipsum dolor sit amet,",
                style: TextStyle(fontSize: 48),
              ),
              Text("Lorem ipsum dolor sit amet,",
                style: TextStyle(fontSize: 48),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
