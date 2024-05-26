import 'dart:developer';

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
    log('Cache initialized');
    await Hive.initFlutter();
    Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(ChannelAdapter())
      ..registerAdapter(MessageAdapter());

    users = await Hive.openBox<User>('users');
    channels = await Hive.openBox<Channel>('channels');
    messages = await Hive.openBox<Message>('messages');
    await Hive.openBox('auth');
  }

  Future<void> cacheToken(String token) async {
    return await Hive.box('auth').put('token', token);
  }

  Future<String?> getToken() async {
    return await Hive.box('auth').get('token');
  }

  Future<void> deleteToken() async {
    return await Hive.box('auth').delete('token');
  }

  Future<void> close() async {
    await Hive.close();
  }
}
