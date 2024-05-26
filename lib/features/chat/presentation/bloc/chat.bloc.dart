import 'package:get/get.dart';
import 'package:humanchat/core/cache.dart';
import 'package:humanchat/core/ws.service.dart';
import 'package:humanchat/entities/channel.entity.dart';
import 'package:humanchat/entities/message.entity.dart';
import 'package:humanchat/features/chat/params/messageEventData.dart';
import 'package:humanchat/utils/types.dart';

/// if currentChannelId is null, it means that user is not in any channel
class ChatBloc extends GetxController {
  final WebSocketService webSocketService = Get.find<WebSocketService>();
  var currentChannelId = Rx<ChannelId?>(null);
  var contentInputChannels = Rx<Map<ChannelId, String>>({});
  var messages = Rx<Map<ChannelId, List<Message>>>({});
  var channels = Rx<List<Channel>>([]);

  @override
  void onInit() {
    super.onInit();
    getChannel();
    messageStream();
  }

  void getChannel() {
    channels.value = Cache().channels.values.toList();
  }

  void getMessage({required ChannelId currentChannelId}) {
    messages.value[currentChannelId] =
        Cache().messages.values.where((message) => message.channel == currentChannelId).toList();
  }

  handleMessage(MessageEventData data) {
    var message = Message(
      messageId: BigInt.parse(data.messageId),
      author: BigInt.parse(data.userId),
      channel: BigInt.parse(data.channelId),
      content: data.content,
    );
    messages.value[message.channel]?.add(message);
    Cache().messages.put(message.messageId, message);
  }

  messageStream() async {
    await webSocketService.ready();
    webSocketService.addEventHandle({'message': handleMessage});
  }
}
