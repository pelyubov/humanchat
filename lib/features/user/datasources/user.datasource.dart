import 'package:get/get.dart';
import 'package:humanchat/features/user/datasources/user.datasource.interface.dart';

class UserDataSource extends GetConnect implements IAuthUser {
  @override
  Future<void> sendFriendRequest({required String friendId}) {}
  @override
  Future<void> acceptFriendRequest({required String friendId}) {}
  @override
  Future<void> ignoreFriendRequest({required String friendId}) {}
  @override
  Future<void> viewProfile({required String userId}) {}
}
