abstract class IAuthUser {
  Future<void> sendFriendRequest({required String friendId});
  Future<void> acceptFriendRequest({required String friendId});
  Future<void> ignoreFriendRequest({required String friendId});
  Future<void> viewProfile({required String userId});
}
