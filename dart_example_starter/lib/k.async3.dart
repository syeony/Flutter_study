
Future<void> fetchUserOrder() async {
  // Imagine that this function is fetching user info but encounters a bug
  return await Future.delayed(const Duration(seconds: 2),
          () => throw Exception('Logout failed: user ID is invalid'));
}

// !! async await....
void main() async {
// !! Exception hadling .1
  try{
    await fetchUserOrder();
  }catch (e){
    print("Exception 발생 : $e");
  }


  // !! Exception hadling .2
  // try{
  //   await fetchUserOrder();
  // }on Exception {  //타입만 지정.exception 객체 받지 않음.
  //   print("Exception 발생 : ");
  // }

  // !! Exception hadling .3
  // try{
  //   await fetchUserOrder();
  // }on Exception catch(e) {  //타입지정 + exception객체 받음
  //   print("Exception 발생 : ${e}");
  // }


  print('Fetching user order...');
}


