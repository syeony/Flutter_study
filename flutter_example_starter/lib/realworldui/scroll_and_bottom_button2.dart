import 'package:flutter/material.dart';

class ScrollAndBottomButton2 extends StatefulWidget {
  const ScrollAndBottomButton2({super.key});

  @override
  State<ScrollAndBottomButton2> createState() => _ScrollAndBottomButton2State();
}

//soft keyboard로 화면이 가려지는 경우 등 높이를 계산해야 하는 경우가 있다.

class _ScrollAndBottomButton2State extends State<ScrollAndBottomButton2> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('중간 상단 스크롤, 하단 버튼, 높이 계산')
      ),
      body: Column(
          children: <Widget>[
            Container(
              height: 250,
              child: Image.asset(
                "assets/sample.jpg",
              ),
            ),
            Text("상단 텍스트",
              style: TextStyle(fontSize: 48),),
            // Expanded면 스크롤이 화면아래쪽까지 연장됨.
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "please input value.."
                  )),
            ),
            Expanded(
                child: ListView(
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  children: List.generate(100, (i) => i)
                      .map((i) {
                        return ListTile(title: Text('$i'));
                  }).toList(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                height: 50,
                color: Colors.orange,
                child: Center(
                  child: InkWell(
                    child: Text("Button"),
                    onTap: () {},
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}
