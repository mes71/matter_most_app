import 'dart:convert';

import 'package:matter_most_app/data/server/model/responses/post/post_response.dart';

class Data {
  Data({
    this.channelDisplayName,
    this.channelName,
    this.channelType,
    this.mentions,
    this.post,
    this.senderName,
    this.setOnline,
    this.teamId,
  });

  Data.fromJson(dynamic json) {
    channelDisplayName = json['channel_display_name'];
    channelName = json['channel_name'];
    channelType = json['channel_type'];
    mentions = json['mentions'];
    post = PostResponse.fromJson(jsonDecode(json['post']));
    senderName = json['sender_name'];
    setOnline = json['set_online'];
    teamId = json['team_id'];
  }

  String? channelDisplayName;
  String? channelName;
  String? channelType;
  String? mentions;
  PostResponse? post;
  String? senderName;
  String? teamId;
  bool? setOnline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channel_display_name'] = channelDisplayName;
    map['channel_name'] = channelName;
    map['channel_type'] = channelType;
    map['mentions'] = mentions;
    map['post'] = post;
    map['sender_name'] = senderName;
    map['set_online'] = setOnline;
    map['team_id'] = teamId;
    return map;
  }

  @override
  String toString() {
    return 'Data{channelDisplayName: $channelDisplayName, channelName: $channelName, channelType: $channelType, mentions: $mentions, post: $post, senderName: $senderName, teamId: $teamId, setOnline: $setOnline}';
  }
}
