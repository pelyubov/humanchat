import 'package:get/get.dart';
import 'package:humanchat/core/api.dart';
import 'package:humanchat/features/user/datasources/user.datasource.interface.dart';

class UserDataSource extends GetConnect implements IAuthUser {
  @override
  Future<void> sendFriendRequest({required String username}) async {
    await post(UserEndpoint.sendRequest.second, {'userId': username});
  }

  @override
  Future<void> acceptFriendRequest({required BigInt friendId}) async {
    await put(UserEndpoint.acceptRequest(userId: friendId), {});
  }

  @override
  Future<void> rejectFriendRequest({required BigInt friendId}) async {
    await delete(UserEndpoint.rejectRequest(userId: friendId));
  }

  @override
  Future<void> userInfo({required BigInt userId}) async {}

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser() {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
