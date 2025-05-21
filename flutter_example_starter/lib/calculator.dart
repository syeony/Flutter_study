import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true
      ),
    );
  }
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();

}

class _CalcAppState extends State<CalcApp>{
  var _buttonList = ["더하기","빼기","곱하기","나누기"];
  List<DropdownMenuItem> _dropItems = [];
  String _sum = "";
  String _selected = "";
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  void initState() { //초기화작업
    super.initState();
    _dropItems = _buttonList.map((item){
      return DropdownMenuItem(value: item, child: Text(item));
    }).toList();

    _selected = _buttonList[0];
  }

  @override
  void dispose() { //반납작업
    controller1.dispose();
    controller2.dispose();
    super.dispose();
    //기본 가이드 : super해제하기 전에 다른것들 해제하기
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('나만의 계산기'),
      ),
      body:Center(
        child: Column(
          children: [
            Text("결과: $_sum",
            style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: controller1,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller2,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(onPressed: (){
              var value1 = double.parse(controller1.value.text);
              var value2 = double.parse(controller2.value.text);
              var result = 0.0;

              setState(() { //화면갱신하려면 setState() 필수!!!
                if(_selected=="더하기"){
                  result = value1+value2;
                }else if(_selected == "빼기"){
                  result = value1-value2;
                }else if(_selected == "곱하기"){
                  result = value1*value2;
                }else if(_selected == "나누기"){
                  result = value1/value2;
                }
              });

              _sum = result.toString();
            },
                child: Text("$_selected")
            ),
            DropdownButton(items: _dropItems,
              onChanged: (value){
                setState(() { //버튼두개 값 연결하려면 setState() 필수!!!
                  _selected = value.toString();
                });
              },
              value: _selected,
            )
          ],
        ),
      )
    );
  }

}