import 'package:flutter_example/realworldui/scroll_and_bottom_button2.dart';
import 'package:flutter_example/realworldui/scroll_and_bottom_button3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/realworldui/scroll_and_bottom_button.dart';
import 'package:flutter_example/realworldui/login_page.dart';
import 'package:flutter_example/realworldui/sns_style_page.dart';

class RealWorldMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('10. 복잡한 UI 작성 <추가 내용>'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('로그인 UI'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          ListTile(
            title: Text('Sns 스타일'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SnsStylePage()),
              );
            },
          ),
          ListTile(
            title: Text('상단 스크롤, 하단 버튼'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScrollAndBottomButton()),
              );
            },
          ),
          ListTile(
            title: Text('중간 스크롤, 복잡한 화면'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScrollAndBottomButton2()),
              );
            },
          ),
          ListTile(
            title: Text('중간 스크롤, 하단 버튼, 높이 계산'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScrollAndBottomButton3()),
              );
            },
          ),
        ],
      ),
    );
  }
}
