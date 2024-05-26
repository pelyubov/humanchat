import 'package:get/get.dart';
import 'package:humanchat/core/api.dart';
import 'package:humanchat/features/chat/params/sendMessage.param.dart';

abstract class IMessageDataSource {}

class MessageDataSource extends GetConnect {
  final String token;

  MessageDataSource({required this.token});
  Future<String> sendMessage(SendMessageParam param) async {
    final res = await post(
      ChatEndpoint.sendMessage(channelId: param.channelId),
      {
        'content': param.content,
        // 'replyTo': param.replyTo?.toString(),
        // TODO: add replyTo
      },
      headers: {'Authorization': 'Bearer $token'},
    );
    return res.body['message'];
  }
}
