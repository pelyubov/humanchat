abstract class IAuthUser {
  Future<void> sendFriendRequest({required String username});
  Future<void> acceptFriendRequest({required BigInt friendId});
  Future<void> rejectFriendRequest({required BigInt friendId});
  Future<void> userInfo({required BigInt userId});
  Future<void> deleteUser();
  Future<void> updateUser();
}
