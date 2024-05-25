import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:humanchat/utils/types.dart';

part 'channel.entity.g.dart';

@HiveType(typeId: 2)
class Channel extends HiveObject {
  @HiveField(0)
  final ChannelId channelId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<UserId> members;
  Channel({
    required this.channelId,
    required this.name,
    required this.members,
  });

  Channel copyWith({
    ChannelId? channelId,
    String? name,
    List<UserId>? members,
  }) {
    return Channel(
      channelId: channelId ?? this.channelId,
      name: name ?? this.name,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'channelId': channelId,
      'name': name,
      'members': members.toList(),
    };
  }

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      channelId: map['channelId'] as ChannelId,
      name: map['name'] as String,
      members: List<UserId>.from(map['members']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Channel.fromJson(String source) =>
      Channel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Channel(channelId: $channelId, name: $name, members: $members)';

  @override
  bool operator ==(covariant Channel other) {
    if (identical(this, other)) return true;

    return other.channelId == channelId && other.name == name && listEquals(other.members, members);
  }

  @override
  int get hashCode => channelId.hashCode ^ name.hashCode ^ members.hashCode;
}
