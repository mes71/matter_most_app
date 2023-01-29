import 'Broadcast.dart';
import 'Data.dart';

class PostedSocketModel {
  PostedSocketModel({
    this.event,
    this.data,
    this.broadcast,
    this.seq,
  });

  PostedSocketModel.fromJson(dynamic json) {
    event = json['event'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    broadcast = json['broadcast'] != null
        ? Broadcast.fromJson(json['broadcast'])
        : null;
    seq = json['seq'];
  }

  String? event;
  Data? data;
  Broadcast? broadcast;
  int? seq;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event'] = event;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (broadcast != null) {
      map['broadcast'] = broadcast?.toJson();
    }
    map['seq'] = seq;
    return map;
  }

  @override
  String toString() {
    return 'PostedSocketModel{event: $event, data: $data, broadcast: $broadcast, seq: $seq}';
  }
}
