import 'package:hive_flutter/hive_flutter.dart';
import 'package:humanchat/entities/channel.entity.dart';
import 'package:humanchat/entities/message.entity.dart';
import 'package:humanchat/entities/user.entity.dart';

class Cache {
  static final Cache _instance = Cache._internal();

  factory Cache() {
    return _instance;
  }

  Cache._internal();

  late final Box<User> users;
  late final Box<Channel> channels;
  late final Box<Message> messages;

  Future<void> init() async {
    Hive
      ..initFlutter()
      ..registerAdapter(UserAdapter())
      ..registerAdapter(ChannelAdapter())
      ..registerAdapter(MessageAdapter());

    users = await Hive.openBox<User>('users');
    channels = await Hive.openBox<Channel>('channels');
    messages = await Hive.openBox<Message>('messages');
  }

  Future<void> close() async {
    await Hive.close();
  }
}
