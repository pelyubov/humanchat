import 'package:humanchat/entities/channel.entity.dart';
import 'package:humanchat/utils/types.dart';

abstract class IChannelDataSource {
  Future<List<Channel>> getAllChannels({required String userId});
  Future<Channel> getChannel({required String channelId});
  Future<Channel> createChannel({required String name, required List<UserId> members});
  Future<Channel> deleteChannel({required String channelId});
  Future<Channel> updateChannel({
    required String channelId,
    required String name,
    required List<UserId> members,
  });
}
