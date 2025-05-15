import 'package:flutter/material.dart';

class ScrollAndBottomButton extends StatefulWidget {
  const ScrollAndBottomButton({super.key});

  @override
  State<ScrollAndBottomButton> createState() => _ScrollAndBottomButtonState();
}

class _ScrollAndBottomButtonState extends State<ScrollAndBottomButton> {
  // 화면에 나머지 공간을 차지할 위젯의 높이를 계산하기 위해서 key를 생성한다.
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();

  late var _screenHeight ;

  var _othersHeight = 0.0;
  // getSize를 호출하면 해당 키의 각각의 높이를 계산해서 _height에 더한다.
  void _getSize( List<GlobalKey> keys ) {
    keys.forEach((e) {
      final RenderBox renderBox = e.currentContext!.findRenderObject() as RenderBox;
      Size size = renderBox.size;
      print("size.length : ${size.height}");
      _othersHeight += size.height;
    });
  }

  // initState에서 화면의 높이를 재계산하기 위해서 _getState를 setState()로 호출한다.
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _getSize([_key1, _key2,]); // height 계산
      });
    });
  }

  void _calcScreenHeight(context){
    _screenHeight = MediaQuery.of(context).size.height;
    _screenHeight -= MediaQuery.of(context).padding.top; //statusbar 빼기
    _screenHeight -= AppBar().preferredSize.height; //appbar 빼기
    print("screenHeight : ${_screenHeight}");
    print("othersHeight : ${_othersHeight}");
  }

  @override
  Widget build(BuildContext context) {
    _calcScreenHeight(context);


    return Scaffold(
      appBar: AppBar(
          title: Text('중간 상단 스크롤, 하단 버튼, 높이 계산')
      ),
      body: Column(
        children: <Widget>[
          Text("상단 텍스트",
            key: _key1,
            style: TextStyle(fontSize: 48),),
          // Expanded면 스크롤이 화면아래쪽까지 연장됨.
          Expanded(
            child: ListView(
              children: List.generate(100, (i) => i)
                  .map((i) {
                    return ListTile(title: Text('$i'));
              }).toList(),
            ),
          ),
          // Container(
          //   height: (_screenHeight - _othersHeight),
          //   child: ListView(
          //     children: List.generate(100, (i) => i)
          //         .map((i) {
          //       return ListTile(title: Text('$i'));
          //     }).toList(),
          //   ),
          // ),
          SizedBox(
            key: _key2,
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
