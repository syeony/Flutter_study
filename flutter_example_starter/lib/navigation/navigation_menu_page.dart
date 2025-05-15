import 'package:flutter_example/navigation/stateless_page.dart';
import 'package:flutter_example/navigation/stateless_page2.dart';
import 'package:flutter/material.dart';

class NavigationMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('11. 네비게이션')
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('네비게이션'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstPage()),
              );
            },
          ),
          ListTile(
            title: Text('네비게이션 - 결과 넘기고 받기'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstPage2()),
              );
            },
          ),
          ListTile(
            title: Text('routes: FirstPage'),
            onTap: () {
              Navigator.pushNamed(context, '/first');
            },
          ),
          ListTile(
            title: Text('routes: SecondPage'),
            onTap: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
        ],
      ),
    );
  }
}
