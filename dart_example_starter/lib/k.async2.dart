
  // 에러 발생
  Future<void> fetchUserOrder() async {
  // Imagine that this function is fetching user info but encounters a bug
    return await Future.delayed(const Duration(seconds: 2),
            () => throw Exception('Logout failed: user ID is invalid'));
  }


  void main() {
    var test = fetchUserOrder();
    print('Fetching user order...');
  }


