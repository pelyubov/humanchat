import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:humanchat/core/api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService extends GetxService {
  final _websocketUrl = Uri.parse(APIEndpoint.websocketPath);
  late final WebSocketChannel channel;
  var eventHandlers = <String, Function>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _connenct();
  }

  void _connenct() {
    channel = WebSocketChannel.connect(_websocketUrl);
    channel.stream.listen((data) {
      _handleData(jsonDecode(data) as Map<String, dynamic>);
    }, onError: (error) {
      log('WebSocket Error: $error');
    }, onDone: () {
      log('WebSocket closed');
    });
  }

  void _handleData(Map<String, dynamic> data) {
    if (!eventHandlers.containsKey(data['event'])) {
      log('Unknown event: ${data['event']}');
      return;
    }
    eventHandlers[data['event']]!(data['data']);
  }

  void addEventHandle(Map<String, Function> eventHandlers) {
    this.eventHandlers.addAll(eventHandlers);
  }

  Future<void> ready() async {
    await channel.ready;
  }

  Future<void> close() async {
    await channel.sink.close();
  }
}
