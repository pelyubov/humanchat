import 'package:flutter/material.dart';

enum MessageState {
  //* Receiver seen the message */
  seen,
  //* The message was sent */
  sent,
  //* The message was received but not sent yet */
  received,
}

enum MessagePosition { left, right }

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.message,
    required this.createAt,
    required this.messageState,
    required this.username,
    required this.messagePosition,
  });

  final String username;
  final String message;
  final String createAt;
  final MessageState messageState;
  final MessagePosition messagePosition;
  // final dynamic attachments;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: messagePosition == MessagePosition.left ? Colors.blue : Colors.white10,
        ),
        child: Column(
          crossAxisAlignment: messagePosition == MessagePosition.left
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Row(children: [
              Text(username),
              Text(createAt),
            ]),
            Text(message)
          ],
        ));
  }
}
