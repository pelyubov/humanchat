import 'package:get/get.dart';
import 'package:humanchat/core/api.dart';
import 'package:humanchat/features/auth/connect/connect.interface.dart';

class AuthConnect extends GetConnect implements IAuthConnect {
  static final AuthConnect _instance = AuthConnect._internal();

  factory AuthConnect() {
    return _instance;
  }

  AuthConnect._internal();

  Future<bool> checkToken({required String token}) async {
    final res = await get(AuthEndpoint.login, query: {'token': token});
    if (res.status.hasError) {
      return false;
    }
    if (res.body['success'] == false) {
      return false;
    }
    return true;
  }

  @override
  Future<String> login({required String email, required String password}) async {
    final res = await post(AuthEndpoint.login, {'email': email, 'password': password});
    if (res.status.hasError) {
      throw Exception(res.statusText.toString());
    }
    if (res.body['success'] == false) {
      throw Exception(res.body['message']);
    }
    return Future.value(res.body['token']);
  }

  @override
  Future<void> logout() async {
    await delete(AuthEndpoint.logout);
  }
}
