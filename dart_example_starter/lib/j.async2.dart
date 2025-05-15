
//2. 비동기 함수가 반환하는 값 이용하기 ===================================

void main() async{
  print('start main');
  await checkData().then((value) => {print(value)});
  print('end main');
}

Future checkData() async {
  var data = await getAllData();
  return data;
}

String getAllData(){
  return 'Hello Dart';
}

