
mixin Fly{
  void mixinFunction(){
    print("mixinFunction");
  }
}
class Person{
  void doSomething(){
    print("Person");
  }
}

//Teacher는 상속 받은 기능외에 Fly의 기능도
//가지고 있다.

//!! polymorphism 테스트
class Teacher extends Person with Fly{
  //do Something ~
  @override
  void mixinFunction() {
    print("mixinFunction in Teacher");
  }
  @override
  void doSomething(){
    mixinFunction();  // mixin한 function을 내것처럼 사용할 수 있다.
    print("Teacher");
  }
}

void main(){
  Fly f = new Teacher(); // ploymorphism도 가능함.
  f.mixinFunction();
  Person p = new Teacher();
  p.doSomething();
  Teacher t = new Teacher();
  t.doSomething();
}
