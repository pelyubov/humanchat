class MessageEventData {
  final String messageId;
  final String userId;
  final String channelId;
  final String content;

  // final DateTime? lastEdit; // Uncomment if you want to include lastEdit

  MessageEventData({
    required this.messageId,
    required this.userId,
    required this.channelId,
    required this.content,
    // this.lastEdit, // Uncomment if you want to include lastEdit
  });
}
