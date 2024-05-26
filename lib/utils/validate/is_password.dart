bool isPassword({required String password}) {
  return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(password);
}
