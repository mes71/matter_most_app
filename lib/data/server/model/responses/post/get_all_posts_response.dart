import 'package:matter_most_app/data/server/model/responses/post/post_response.dart';

/// order : ["6yf96pitaiyk3x4numb17fmt8y","f3u5h4cnppfeby6e8f81neyx3h","431g71z4h7nz9gjiu9xpkxezgc"]
/// posts : {"431g71z4h7nz9gjiu9xpkxezgc":{"id":"431g71z4h7nz9gjiu9xpkxezgc","create_at":1673935503675,"update_at":1673935503675,"edit_at":0,"delete_at":0,"is_pinned":false,"user_id":"auccpm1zqjyy8ft89itwxo35ah","channel_id":"6a8qo3ryx3nibcbwr36jn1n9jr","root_id":"","original_id":"","message":"hiiii","type":"","props":{},"hashtags":"","pending_post_id":"","reply_count":0,"last_reply_at":0,"participants":null,"metadata":{}},"6yf96pitaiyk3x4numb17fmt8y":{"id":"6yf96pitaiyk3x4numb17fmt8y","create_at":1673942091922,"update_at":1673942091922,"edit_at":0,"delete_at":0,"is_pinned":false,"user_id":"8zicg1m6ebrdmcifiac88psq5r","channel_id":"6a8qo3ryx3nibcbwr36jn1n9jr","root_id":"","original_id":"","message":"koko","type":"","props":{},"hashtags":"","pending_post_id":"","reply_count":0,"last_reply_at":0,"participants":null,"metadata":{}},"f3u5h4cnppfeby6e8f81neyx3h":{"id":"f3u5h4cnppfeby6e8f81neyx3h","create_at":1673935612750,"update_at":1673935612750,"edit_at":0,"delete_at":0,"is_pinned":false,"user_id":"8zicg1m6ebrdmcifiac88psq5r","channel_id":"6a8qo3ryx3nibcbwr36jn1n9jr","root_id":"","original_id":"","message":"hi how are you?","type":"","props":{},"hashtags":"","pending_post_id":"","reply_count":0,"last_reply_at":0,"participants":null,"metadata":{}}}
/// next_post_id : ""
/// prev_post_id : ""
/// has_next : false

class GetAllPostsResponse {
  GetAllPostsResponse({
    List<String>? order,
    Map<String, PostResponse>? posts,
    String? nextPostId,
    String? prevPostId,
    bool? hasNext,
  }) {
    _order = order;
    _posts = posts;
    _nextPostId = nextPostId;
    _prevPostId = prevPostId;
    _hasNext = hasNext;
  }

  GetAllPostsResponse.fromJson(dynamic json) {
    _order = json['order'] != null ? json['order'].cast<String>() : [];
    _posts = {};
    if (json['posts'] != null) {
      Map<String, dynamic> tmp = json['posts'];
      Map<String, PostResponse> tmp2 =
          tmp.map((key, value) => MapEntry(key, PostResponse.fromJson(value)));

      _posts?.addAll(tmp2);
    }

    _nextPostId = json['next_post_id'];
    _prevPostId = json['prev_post_id'];
    _hasNext = json['has_next'];
  }

  List<String>? _order;
  Map<String, PostResponse>? _posts;
  String? _nextPostId;
  String? _prevPostId;
  bool? _hasNext;

  GetAllPostsResponse copyWith({
    List<String>? order,
    Map<String, PostResponse>? posts,
    String? nextPostId,
    String? prevPostId,
    bool? hasNext,
  }) =>
      GetAllPostsResponse(
        order: order ?? _order,
        posts: posts ?? _posts,
        nextPostId: nextPostId ?? _nextPostId,
        prevPostId: prevPostId ?? _prevPostId,
        hasNext: hasNext ?? _hasNext,
      );

  List<String> get order => _order!;

  Map<String, PostResponse> get posts => _posts!;


  set posts(Map<String, PostResponse> value) {
    _posts = value;
  }

  String? get nextPostId => _nextPostId;

  String? get prevPostId => _prevPostId;

  bool? get hasNext => _hasNext;

  @override
  String toString() {
    return 'GetAllPostsResponse{_order: $_order, _posts: $_posts, _nextPostId: $_nextPostId, _prevPostId: $_prevPostId, _hasNext: $_hasNext}';
  }
}
