abstract class IAuthConnect {
  Future<String> login({required String email, required String password});
  Future<void> logout();
  // Future<dynamic> forgotPassword({required String email});
  // Future<dynamic> sendOTP({required String otp});
}
