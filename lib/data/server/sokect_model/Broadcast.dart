class Broadcast {
  Broadcast({
    this.omitUsers,
    this.userId,
    this.channelId,
    this.teamId,
    this.connectionId,
  });

  Broadcast.fromJson(dynamic json) {
    omitUsers = json['omit_users'];
    userId = json['user_id'];
    channelId = json['channel_id'];
    teamId = json['team_id'];
    connectionId = json['connection_id'];
  }

  dynamic? omitUsers;
  String? userId;
  String? channelId;
  String? teamId;
  String? connectionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['omit_users'] = omitUsers;
    map['user_id'] = userId;
    map['channel_id'] = channelId;
    map['team_id'] = teamId;
    map['connection_id'] = connectionId;
    return map;
  }

  @override
  String toString() {
    return 'Broadcast{omitUsers: $omitUsers, userId: $userId, channelId: $channelId, teamId: $teamId, connectionId: $connectionId}';
  }
}
