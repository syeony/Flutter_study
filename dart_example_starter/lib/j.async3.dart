
//3. delayed와 await 이용한 흐름 제어 ===================================

void main(){
  print('start main');
  getData1();
  getData2();
  getData3();
  print('end main');
}
void getData1(){
  print('getData1 called..');
}
getData2() async {
  await Future.delayed(Duration(seconds: 2), () =>
    print('Future method called...')
  );
  print('getData2 called..');
}
void getData3(){
  print('getData3 called..');
}

