import 'package:humanchat/core/api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class UWebSocket {
  static final _instance = UWebSocket._();
  static final _websocketUrl = Uri.parse(APIEndpoint.websocketPath);
  static final _channel = WebSocketChannel.connect(_websocketUrl);

  UWebSocket._();

  factory UWebSocket() {
    return _instance;
  }
}
