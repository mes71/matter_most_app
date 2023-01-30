/// id : "9xsitfy1cfbtmjtauh38q1k4ua"
/// type : "attachment"
/// create_at : 1675066153673
/// user_id : "5ak9ej4hu7fcp8t91ef13h6mhw"
/// channel_id : "8t5tibt5ktdajx1r9dza4r8gte"
/// filename : "C:/Users/Mr.Mojtaba/Downloads/591-536x354.jpg"
/// file_size : 25583
/// file_offset : 0
/// remote_id : ""
/// req_file_id : ""

class UploadModelResponse {
  UploadModelResponse({
      String? id, 
      String? type, 
      num? createAt, 
      String? userId, 
      String? channelId, 
      String? filename, 
      num? fileSize, 
      num? fileOffset, 
      String? remoteId, 
      String? reqFileId,}){
    _id = id;
    _type = type;
    _createAt = createAt;
    _userId = userId;
    _channelId = channelId;
    _filename = filename;
    _fileSize = fileSize;
    _fileOffset = fileOffset;
    _remoteId = remoteId;
    _reqFileId = reqFileId;
}

  UploadModelResponse.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _createAt = json['create_at'];
    _userId = json['user_id'];
    _channelId = json['channel_id'];
    _filename = json['filename'];
    _fileSize = json['file_size'];
    _fileOffset = json['file_offset'];
    _remoteId = json['remote_id'];
    _reqFileId = json['req_file_id'];
  }
  String? _id;
  String? _type;
  num? _createAt;
  String? _userId;
  String? _channelId;
  String? _filename;
  num? _fileSize;
  num? _fileOffset;
  String? _remoteId;
  String? _reqFileId;
UploadModelResponse copyWith({  String? id,
  String? type,
  num? createAt,
  String? userId,
  String? channelId,
  String? filename,
  num? fileSize,
  num? fileOffset,
  String? remoteId,
  String? reqFileId,
}) => UploadModelResponse(  id: id ?? _id,
  type: type ?? _type,
  createAt: createAt ?? _createAt,
  userId: userId ?? _userId,
  channelId: channelId ?? _channelId,
  filename: filename ?? _filename,
  fileSize: fileSize ?? _fileSize,
  fileOffset: fileOffset ?? _fileOffset,
  remoteId: remoteId ?? _remoteId,
  reqFileId: reqFileId ?? _reqFileId,
);
  String? get id => _id;
  String? get type => _type;
  num? get createAt => _createAt;
  String? get userId => _userId;
  String? get channelId => _channelId;
  String? get filename => _filename;
  num? get fileSize => _fileSize;
  num? get fileOffset => _fileOffset;
  String? get remoteId => _remoteId;
  String? get reqFileId => _reqFileId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['create_at'] = _createAt;
    map['user_id'] = _userId;
    map['channel_id'] = _channelId;
    map['filename'] = _filename;
    map['file_size'] = _fileSize;
    map['file_offset'] = _fileOffset;
    map['remote_id'] = _remoteId;
    map['req_file_id'] = _reqFileId;
    return map;
  }

}