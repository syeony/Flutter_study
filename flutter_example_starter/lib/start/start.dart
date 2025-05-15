import 'package:flutter_example/multi/column_page.dart';
import 'package:flutter_example/multi/container_page.dart';
import 'package:flutter_example/multi/row_page.dart';
import 'package:flutter_example/multi/stack_page.dart';
import 'package:flutter/material.dart';

class StartMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Basic'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Container'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContainerPage()),
              );
            },
          ),
          ListTile(
            title: Text('Column'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ColumnPage()),
              );
            },
          ),
          ListTile(
            title: Text('Row'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RowPage()),
              );
            },
          ),
          ListTile(
            title: Text('Stack'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StackPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
