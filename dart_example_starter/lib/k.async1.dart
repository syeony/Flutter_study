
//실행 완료 ----
Future<void> fetchUserOrder() async {
  // Imagine that this function is fetching user info from another service or database.
  return await Future.delayed(const Duration(seconds: 2), () => print('Large Latte'));
}

void main() {
  var test = fetchUserOrder();
  test.whenComplete(() => print("작업완료"));
  print('Fetching user order...');
}
