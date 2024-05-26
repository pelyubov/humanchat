// ignore_for_file: constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:humanchat/utils/pair.dart';

enum HttpMethods {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE,
}

class Endpoint {
  static final String apiEndpoint = dotenv.get('URL');
  static final String wsEndpoint = dotenv.get('WEBSOCKET_URL');
}

class AuthEndpoint {
  static final login = Pair(HttpMethods.POST, '${Endpoint.apiEndpoint}/login');
  static final logout = Pair(HttpMethods.POST, '${Endpoint.apiEndpoint}/logout');
  static final signUp = Pair(HttpMethods.POST, '${Endpoint.apiEndpoint}/register');
}

class UserEndpoint {
  static final baseUrl = '${Endpoint.apiEndpoint}/@me';
  static final update = Pair(HttpMethods.PATCH, baseUrl);
  static final delete = Pair(HttpMethods.DELETE, baseUrl);
  static final info = Pair(HttpMethods.GET, baseUrl);
  static final requests = Pair(HttpMethods.GET, '$baseUrl/requests');
  static final sendRequest = Pair(HttpMethods.POST, '${UserEndpoint.requests}/new');
  static acceptRequest({required BigInt userId}) =>
      Pair(HttpMethods.PUT, '${UserEndpoint.requests}/$userId/accept');
  static rejectRequest({required BigInt userId}) =>
      Pair(HttpMethods.DELETE, '${UserEndpoint.requests}/$userId/reject');
  static final getFriendsRequests = Pair(HttpMethods.GET, '${UserEndpoint.requests}/outgoing');
  static final getIncomingRequests = Pair(HttpMethods.GET, '${UserEndpoint.requests}/incoming');
}

class ChatEndpoint {
  static final baseUrl = '${Endpoint.apiEndpoint}/channels';
  static final getChannels = Pair(HttpMethods.GET, baseUrl);
  static final createChannel = Pair(HttpMethods.POST, '$baseUrl/create');
  static channelInfo({required BigInt channelId}) => Pair(HttpMethods.GET, '$baseUrl/$channelId');
  static editChannel({required BigInt channelId}) =>
      Pair(HttpMethods.PATCH, '$baseUrl/$channelId/edit');
  static deleteChannel({required BigInt channelId}) =>
      Pair(HttpMethods.DELETE, '$baseUrl/$channelId/delete');
  static joinChannelByInvite({required String invite}) =>
      Pair(HttpMethods.POST, '$baseUrl/join/$invite');
  static createInvite({required BigInt channelId}) =>
      Pair(HttpMethods.POST, '$baseUrl/$channelId/invite');
  static leaveChannel({required BigInt channelId}) =>
      Pair(HttpMethods.DELETE, '$baseUrl/$channelId/leave');
  static sendMessage({required BigInt channelId}) =>
      Pair(HttpMethods.POST, '$baseUrl/$channelId/messages');
  static editMessage({required BigInt channelId, required BigInt messageId}) =>
      Pair(HttpMethods.PATCH, '$baseUrl/$channelId/messages/$messageId');
  static deleteMessage({required BigInt channelId, required BigInt messageId}) =>
      Pair(HttpMethods.DELETE, '$baseUrl/$channelId/messages/$messageId');
}
