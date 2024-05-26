import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:humanchat/utils/types.dart';

class APIEndpoint {
  static final String serverPath = dotenv.get('URL');
  static final String websocketPath = dotenv.get('WEBSOCKET_URL');
}

class AuthEndpoint {
  static final String _auth = '${APIEndpoint.serverPath}/api';
  static final String login = '$_auth/login';
  static final String logout = '$_auth/logout';
  // static final String forgotPassword = '$_auth/forgot-password';
  // static final String checkPinCode = '$_auth/check-pin-code';
}

/// [update]: HTTP Patch
class UserEndpoint {
  static final String signUp = '${APIEndpoint.serverPath}/signup';
  static final String _user = '${APIEndpoint.serverPath}/@me';
  static final String updateUser = _user;
  static final String deleteUser = _user;
  static final String getSelfInfo = _user;

  static final String sendRequest = '$_user/requests/new';
  static String acceptRequest({required String id}) => '$_user/request/$id/accept';

  static String deleteRelation({required String id}) => '$_user/request/$id/reject';
  static String getFriendsRequests = '$_user/requests/outgoing';
  static String getIncomingRequests = '$_user/requests/incoming';
}

class ChatEndpoint {
  static String sendMessage({required ChannelId channelId}) =>
      '${APIEndpoint.serverPath}/api/channels/$channelId/messages';
  // static String channel({required ChannelId channelId}) =>
}

// class ChannelEndpoint {
//   static final String _channel = '${APIEndpoint.serverPath}/channel';
//   static String getChannel(String channelId) =>
//       Uri.http(_channel, '/channel/get', {'channelId': channelId}).toString();

//   static String getAllChannels(String userId) =>
//       Uri.http(_channel, '/channel/get-all', {'userId': userId}).toString();

//   static String createChannel(String userId) =>
//       Uri.http(_channel, '/channel/create', {'userId': userId}).toString();

//   static String deleteChannel(String userId, String channelId) =>
//       Uri.http(_channel, '/channel/delete', {'userId': userId, 'channelId': channelId}).toString();

//   static String updateChannel(String channelId) =>
//       Uri.http(_channel, '/channel/update', {'channelId': channelId}).toString();

//   static String get addMembers => '$_channel/channel/add-members';

//   static String removeMembers(String channelId) => '$_channel/channel/$channelId/remove-members';
// }
