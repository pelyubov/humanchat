import 'package:get/get.dart';
import 'package:humanchat/entities/channel.entity.dart';
import 'package:humanchat/features/channel/datasources/channel.datasource.interface.dart';
import 'package:humanchat/utils/types.dart';

class ChannelDataSource extends GetConnect implements IChannelDataSource {
  @override
  Future<Channel> createChannel({required String name, required List<UserId> members}) {
    // TODO: implement createChannel
    throw UnimplementedError();
  }

  @override
  Future<Channel> deleteChannel({required String channelId}) {
    // TODO: implement deleteChannel
    throw UnimplementedError();
  }

  @override
  Future<List<Channel>> getAllChannels({required String userId}) {
    // TODO: implement getAllChannels
    throw UnimplementedError();
  }

  @override
  Future<Channel> getChannel({required String channelId}) {
    // TODO: implement getChannel
    throw UnimplementedError();
  }

  @override
  Future<Channel> updateChannel(
      {required String channelId, required String name, required List<UserId> members}) {
    // TODO: implement updateChannel
    throw UnimplementedError();
  }
}
