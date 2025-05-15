
import 'c_oop.dart';

void main(){
  var tea = Teacher();
  tea.name = '손홍민';
  tea.subject = 'Flutter';

   //getter 호출
  print(tea.name);
  print(tea.subject);

  // print(tea._subject);
}

