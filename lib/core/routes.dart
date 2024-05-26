class AppRoutes {
  static const String loading = '/';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String chatList = '/chat/list';
  static const String chatAdd = '/chat/add';
  static String channel({required String channelId}) => '/channel/in/$channelId';
}
