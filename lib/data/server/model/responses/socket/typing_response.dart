/// event : "typing"
/// data : {"parent_id":"","user_id":"jmtmmxtenpreug3yw9ma56r6ww"}
/// broadcast : {"omit_users":{"jmtmmxtenpreug3yw9ma56r6ww":true},"user_id":"","channel_id":"8t5tibt5ktdajx1r9dza4r8gte","team_id":"","connection_id":""}
/// seq : 6

class TypingResponse {
  TypingResponse({
    String? event,
    Data? data,
    Broadcast? broadcast,
    num? seq,
  }) {
    _event = event;
    _data = data;
    _broadcast = broadcast;
    _seq = seq;
  }

  TypingResponse.fromJson(dynamic json) {
    _event = json['event'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _broadcast = json['broadcast'] != null
        ? Broadcast.fromJson(json['broadcast'])
        : null;
    _seq = json['seq'];
  }

  String? _event;
  Data? _data;
  Broadcast? _broadcast;
  num? _seq;

  TypingResponse copyWith({
    String? event,
    Data? data,
    Broadcast? broadcast,
    num? seq,
  }) =>
      TypingResponse(
        event: event ?? _event,
        data: data ?? _data,
        broadcast: broadcast ?? _broadcast,
        seq: seq ?? _seq,
      );

  String? get event => _event;

  Data? get data => _data;

  Broadcast? get broadcast => _broadcast;

  num? get seq => _seq;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event'] = _event;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_broadcast != null) {
      map['broadcast'] = _broadcast?.toJson();
    }
    map['seq'] = _seq;
    return map;
  }
}

/// omit_users : {"jmtmmxtenpreug3yw9ma56r6ww":true}
/// user_id : ""
/// channel_id : "8t5tibt5ktdajx1r9dza4r8gte"
/// team_id : ""
/// connection_id : ""

class Broadcast {
  Broadcast({
    OmitUsers? omitUsers,
    String? userId,
    String? channelId,
    String? teamId,
    String? connectionId,
  }) {
    _omitUsers = omitUsers;
    _userId = userId;
    _channelId = channelId;
    _teamId = teamId;
    _connectionId = connectionId;
  }

  Broadcast.fromJson(dynamic json) {
    _omitUsers = json['omit_users'] != null
        ? OmitUsers.fromJson(json['omit_users'])
        : null;
    _userId = json['user_id'];
    _channelId = json['channel_id'];
    _teamId = json['team_id'];
    _connectionId = json['connection_id'];
  }

  OmitUsers? _omitUsers;
  String? _userId;
  String? _channelId;
  String? _teamId;
  String? _connectionId;

  Broadcast copyWith({
    OmitUsers? omitUsers,
    String? userId,
    String? channelId,
    String? teamId,
    String? connectionId,
  }) =>
      Broadcast(
        omitUsers: omitUsers ?? _omitUsers,
        userId: userId ?? _userId,
        channelId: channelId ?? _channelId,
        teamId: teamId ?? _teamId,
        connectionId: connectionId ?? _connectionId,
      );

  OmitUsers? get omitUsers => _omitUsers;

  String? get userId => _userId;

  String? get channelId => _channelId;

  String? get teamId => _teamId;

  String? get connectionId => _connectionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_omitUsers != null) {
      map['omit_users'] = _omitUsers?.toJson();
    }
    map['user_id'] = _userId;
    map['channel_id'] = _channelId;
    map['team_id'] = _teamId;
    map['connection_id'] = _connectionId;
    return map;
  }
}

/// jmtmmxtenpreug3yw9ma56r6ww : true

class OmitUsers {
  OmitUsers({
    bool? jmtmmxtenpreug3yw9ma56r6ww,
  }) {
    _jmtmmxtenpreug3yw9ma56r6ww = jmtmmxtenpreug3yw9ma56r6ww;
  }

  OmitUsers.fromJson(dynamic json) {
    _jmtmmxtenpreug3yw9ma56r6ww = json['jmtmmxtenpreug3yw9ma56r6ww'];
  }

  bool? _jmtmmxtenpreug3yw9ma56r6ww;

  OmitUsers copyWith({
    bool? jmtmmxtenpreug3yw9ma56r6ww,
  }) =>
      OmitUsers(
        jmtmmxtenpreug3yw9ma56r6ww:
            jmtmmxtenpreug3yw9ma56r6ww ?? _jmtmmxtenpreug3yw9ma56r6ww,
      );

  bool? get jmtmmxtenpreug3yw9ma56r6ww => _jmtmmxtenpreug3yw9ma56r6ww;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jmtmmxtenpreug3yw9ma56r6ww'] = _jmtmmxtenpreug3yw9ma56r6ww;
    return map;
  }
}

/// parent_id : ""
/// user_id : "jmtmmxtenpreug3yw9ma56r6ww"

class Data {
  Data({
    String? parentId,
    String? userId,
  }) {
    _parentId = parentId;
    _userId = userId;
  }

  Data.fromJson(dynamic json) {
    _parentId = json['parent_id'];
    _userId = json['user_id'];
  }

  String? _parentId;
  String? _userId;

  Data copyWith({
    String? parentId,
    String? userId,
  }) =>
      Data(
        parentId: parentId ?? _parentId,
        userId: userId ?? _userId,
      );

  String? get parentId => _parentId;

  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['parent_id'] = _parentId;
    map['user_id'] = _userId;
    return map;
  }
}
