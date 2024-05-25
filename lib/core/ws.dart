import 'package:humanchat/core/api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WS {
  static final _instance = WS._();
  static final _websocketUrl = Uri.parse(APIEndpoint.websocketPath);
  static final channel = WebSocketChannel.connect(_websocketUrl);

  WS._();

  factory WS() {
    return _instance;
  }

  Future<void> ready() async {
    await channel.ready;
  }
}
