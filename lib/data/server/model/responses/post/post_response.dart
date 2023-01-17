/// id : "431g71z4h7nz9gjiu9xpkxezgc"
/// create_at : 1673935503675
/// update_at : 1673935503675
/// edit_at : 0
/// delete_at : 0
/// is_pinned : false
/// user_id : "auccpm1zqjyy8ft89itwxo35ah"
/// channel_id : "6a8qo3ryx3nibcbwr36jn1n9jr"
/// root_id : ""
/// original_id : ""
/// message : "hiiii"
/// type : ""
/// props : {}
/// hashtags : ""
/// pending_post_id : ""
/// reply_count : 0
/// last_reply_at : 0
/// participants : null
/// metadata : {}

class PostResponse {
  PostResponse({
    String? id,
    num? createAt,
    num? updateAt,
    num? editAt,
    num? deleteAt,
    bool? isPinned,
    String? userId,
    String? channelId,
    String? rootId,
    String? originalId,
    String? message,
    String? type,
    dynamic props,
    String? hashtags,
    String? pendingPostId,
    num? replyCount,
    num? lastReplyAt,
    dynamic participants,
    dynamic metadata,
  }) {
    _id = id;
    _createAt = createAt;
    _updateAt = updateAt;
    _editAt = editAt;
    _deleteAt = deleteAt;
    _isPinned = isPinned;
    _userId = userId;
    _channelId = channelId;
    _rootId = rootId;
    _originalId = originalId;
    _message = message;
    _type = type;
    _props = props;
    _hashtags = hashtags;
    _pendingPostId = pendingPostId;
    _replyCount = replyCount;
    _lastReplyAt = lastReplyAt;
    _participants = participants;
    _metadata = metadata;
  }

  PostResponse.fromJson(dynamic json) {
    _id = json['id'];
    _createAt = json['create_at'];
    _updateAt = json['update_at'];
    _editAt = json['edit_at'];
    _deleteAt = json['delete_at'];
    _isPinned = json['is_pinned'];
    _userId = json['user_id'];
    _channelId = json['channel_id'];
    _rootId = json['root_id'];
    _originalId = json['original_id'];
    _message = json['message'];
    _type = json['type'];
    _props = json['props'];
    _hashtags = json['hashtags'];
    _pendingPostId = json['pending_post_id'];
    _replyCount = json['reply_count'];
    _lastReplyAt = json['last_reply_at'];
    _participants = json['participants'];
    _metadata = json['metadata'];
  }
  String? _id;
  num? _createAt;
  num? _updateAt;
  num? _editAt;
  num? _deleteAt;
  bool? _isPinned;
  String? _userId;
  String? _channelId;
  String? _rootId;
  String? _originalId;
  String? _message;
  String? _type;
  dynamic _props;
  String? _hashtags;
  String? _pendingPostId;
  num? _replyCount;
  num? _lastReplyAt;
  dynamic _participants;
  dynamic _metadata;
  PostResponse copyWith({
    String? id,
    num? createAt,
    num? updateAt,
    num? editAt,
    num? deleteAt,
    bool? isPinned,
    String? userId,
    String? channelId,
    String? rootId,
    String? originalId,
    String? message,
    String? type,
    dynamic props,
    String? hashtags,
    String? pendingPostId,
    num? replyCount,
    num? lastReplyAt,
    dynamic participants,
    dynamic metadata,
  }) =>
      PostResponse(
        id: id ?? _id,
        createAt: createAt ?? _createAt,
        updateAt: updateAt ?? _updateAt,
        editAt: editAt ?? _editAt,
        deleteAt: deleteAt ?? _deleteAt,
        isPinned: isPinned ?? _isPinned,
        userId: userId ?? _userId,
        channelId: channelId ?? _channelId,
        rootId: rootId ?? _rootId,
        originalId: originalId ?? _originalId,
        message: message ?? _message,
        type: type ?? _type,
        props: props ?? _props,
        hashtags: hashtags ?? _hashtags,
        pendingPostId: pendingPostId ?? _pendingPostId,
        replyCount: replyCount ?? _replyCount,
        lastReplyAt: lastReplyAt ?? _lastReplyAt,
        participants: participants ?? _participants,
        metadata: metadata ?? _metadata,
      );
  String? get id => _id;
  num? get createAt => _createAt;
  num? get updateAt => _updateAt;
  num? get editAt => _editAt;
  num? get deleteAt => _deleteAt;
  bool? get isPinned => _isPinned;
  String? get userId => _userId;
  String? get channelId => _channelId;
  String? get rootId => _rootId;
  String? get originalId => _originalId;
  String? get message => _message;
  String? get type => _type;
  dynamic get props => _props;
  String? get hashtags => _hashtags;
  String? get pendingPostId => _pendingPostId;
  num? get replyCount => _replyCount;
  num? get lastReplyAt => _lastReplyAt;
  dynamic get participants => _participants;
  dynamic get metadata => _metadata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['create_at'] = _createAt;
    map['update_at'] = _updateAt;
    map['edit_at'] = _editAt;
    map['delete_at'] = _deleteAt;
    map['is_pinned'] = _isPinned;
    map['user_id'] = _userId;
    map['channel_id'] = _channelId;
    map['root_id'] = _rootId;
    map['original_id'] = _originalId;
    map['message'] = _message;
    map['type'] = _type;
    map['props'] = _props;
    map['hashtags'] = _hashtags;
    map['pending_post_id'] = _pendingPostId;
    map['reply_count'] = _replyCount;
    map['last_reply_at'] = _lastReplyAt;
    map['participants'] = _participants;
    map['metadata'] = _metadata;
    return map;
  }

  @override
  String toString() {
    return 'PostResponse{_id: $_id, _createAt: $_createAt, _updateAt: $_updateAt, _editAt: $_editAt, _deleteAt: $_deleteAt, _isPinned: $_isPinned, _userId: $_userId, _channelId: $_channelId, _rootId: $_rootId, _originalId: $_originalId, _message: $_message, _type: $_type, _props: $_props, _hashtags: $_hashtags, _pendingPostId: $_pendingPostId, _replyCount: $_replyCount, _lastReplyAt: $_lastReplyAt, _participants: $_participants, _metadata: $_metadata}';
  }
}
