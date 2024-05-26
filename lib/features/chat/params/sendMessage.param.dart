// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:humanchat/utils/types.dart';

class SendMessageParam {
  final UserId? replyTo;
  final ChannelId channelId;
  final String content;
  SendMessageParam({
    this.replyTo,
    required this.channelId,
    required this.content,
  });
}
