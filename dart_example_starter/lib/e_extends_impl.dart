// class를 implemenets 할 수 있다.

// 구현부 없는 abstract class 선언
abstract class Vehicle{
  void describe();
}

class Car extends Vehicle { //상속
  @override
  void describe() {
    print("this is Car");
  }
}

class Taxi implements Vehicle{ //구현
  @override
  void describe() {
    print("this is taxi");
  }
}

void main(){
  Vehicle vehicle1 = Car();
  vehicle1.describe();
  Vehicle vehicle2 = Taxi();
  vehicle2.describe();
}


