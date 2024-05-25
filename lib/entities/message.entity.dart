import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:humanchat/utils/types.dart';

part 'message.entity.g.dart';

@HiveType(typeId: 3)
class Message extends HiveObject {
  @HiveField(0)
  final MessageId messageId;
  @HiveField(1)
  final UserId author;
  @HiveField(2)
  final UserId? replyTo;
  @HiveField(3)
  final ChannelId channel;
  @HiveField(4)
  final String content;
  @HiveField(5)
  final DateTime? lastEdit;
  Message({
    required this.messageId,
    required this.author,
    this.replyTo,
    required this.channel,
    required this.content,
    this.lastEdit,
  });

  Message copyWith({
    MessageId? messageId,
    UserId? author,
    UserId? replyTo,
    ChannelId? channel,
    String? content,
    DateTime? lastEdit,
  }) {
    return Message(
      messageId: messageId ?? this.messageId,
      author: author ?? this.author,
      replyTo: replyTo ?? this.replyTo,
      channel: channel ?? this.channel,
      content: content ?? this.content,
      lastEdit: lastEdit ?? this.lastEdit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageId': messageId,
      'author': author,
      'replyTo': replyTo,
      'channel': channel,
      'content': content,
      'lastEdit': lastEdit?.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      messageId: map['messageId'] as MessageId,
      author: map['author'] as UserId,
      replyTo: map['replyTo'] != null ? map['replyTo'] as UserId : null,
      channel: map['channel'] as ChannelId,
      content: map['content'] as String,
      lastEdit: map['lastEdit'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastEdit'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(messageId: $messageId, author: $author, replyTo: $replyTo, channel: $channel, content: $content, lastEdit: $lastEdit)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.messageId == messageId &&
        other.author == author &&
        other.replyTo == replyTo &&
        other.channel == channel &&
        other.content == content &&
        other.lastEdit == lastEdit;
  }

  @override
  int get hashCode {
    return messageId.hashCode ^
        author.hashCode ^
        replyTo.hashCode ^
        channel.hashCode ^
        content.hashCode ^
        lastEdit.hashCode;
  }
}
