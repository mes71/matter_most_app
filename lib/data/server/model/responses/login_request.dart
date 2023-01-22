/// id : "ngypbp7uzpfepk9f6kuf9hjfba"
/// create_at : 1672830834550
/// update_at : 1672830844897
/// delete_at : 0
/// username : "mr.mojtaba"
/// auth_data : ""
/// auth_service : ""
/// email : "a@a.com"
/// nickname : ""
/// first_name : ""
/// last_name : ""
/// position : ""
/// roles : "system_admin system_user"
/// allow_marketing : true
/// notify_props : {"channel":"true","comments":"never","desktop":"mention","desktop_sound":"true","desktop_threads":"all","email":"true","email_threads":"all","first_name":"false","mention_keys":"","push":"mention","push_status":"away","push_threads":"all"}
/// last_password_update : 1672830834550
/// locale : "en"
/// timezone : {"automaticTimezone":"Asia/Tehran","manualTimezone":"","useAutomaticTimezone":"true"}
/// disable_welcome_email : false

class UserResponse {
  UserResponse({
    String? id,
    String? token,
    num? createAt,
    num? updateAt,
    num? deleteAt,
    String? username,
    String? authData,
    String? authService,
    String? email,
    String? nickname,
    String? firstName,
    String? lastName,
    String? position,
    String? roles,
    bool? allowMarketing,
    NotifyProps? notifyProps,
    num? lastPasswordUpdate,
    String? locale,
    Timezone? timezone,
    bool? disableWelcomeEmail,
  }) {
    _id = id;
    _token = token;
    _createAt = createAt;
    _updateAt = updateAt;
    _deleteAt = deleteAt;
    _username = username;
    _authData = authData;
    _authService = authService;
    _email = email;
    _nickname = nickname;
    _firstName = firstName;
    _lastName = lastName;
    _position = position;
    _roles = roles;
    _allowMarketing = allowMarketing;
    _notifyProps = notifyProps;
    _lastPasswordUpdate = lastPasswordUpdate;
    _locale = locale;
    _timezone = timezone;
    _disableWelcomeEmail = disableWelcomeEmail;
  }

  UserResponse.fromJson(dynamic json, {required String token}) {
    _id = json['id'];
    _token = token;
    _createAt = json['create_at'];
    _updateAt = json['update_at'];
    _deleteAt = json['delete_at'];
    _username = json['username'];
    _authData = json['auth_data'];
    _authService = json['auth_service'];
    _email = json['email'];
    _nickname = json['nickname'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _position = json['position'];
    _roles = json['roles'];
    _allowMarketing = json['allow_marketing'];
    _notifyProps = json['notify_props'] != null
        ? NotifyProps.fromJson(json['notify_props'])
        : null;
    _lastPasswordUpdate = json['last_password_update'];
    _locale = json['locale'];
    _timezone =
        json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null;
    _disableWelcomeEmail = json['disable_welcome_email'];
  }

  String? _id;
  String? _token;
  num? _createAt;
  num? _updateAt;
  num? _deleteAt;
  String? _username;
  String? _authData;
  String? _authService;
  String? _email;
  String? _nickname;
  String? _firstName;
  String? _lastName;
  String? _position;
  String? _roles;
  bool? _allowMarketing;
  NotifyProps? _notifyProps;
  num? _lastPasswordUpdate;
  String? _locale;
  Timezone? _timezone;
  bool? _disableWelcomeEmail;

  UserResponse copyWith({
    String? id,
    num? createAt,
    num? updateAt,
    num? deleteAt,
    String? username,
    String? authData,
    String? authService,
    String? email,
    String? nickname,
    String? firstName,
    String? lastName,
    String? position,
    String? roles,
    bool? allowMarketing,
    NotifyProps? notifyProps,
    num? lastPasswordUpdate,
    String? locale,
    Timezone? timezone,
    bool? disableWelcomeEmail,
  }) =>
      UserResponse(
        id: id ?? _id,
        createAt: createAt ?? _createAt,
        updateAt: updateAt ?? _updateAt,
        deleteAt: deleteAt ?? _deleteAt,
        username: username ?? _username,
        authData: authData ?? _authData,
        authService: authService ?? _authService,
        email: email ?? _email,
        nickname: nickname ?? _nickname,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        position: position ?? _position,
        roles: roles ?? _roles,
        allowMarketing: allowMarketing ?? _allowMarketing,
        notifyProps: notifyProps ?? _notifyProps,
        lastPasswordUpdate: lastPasswordUpdate ?? _lastPasswordUpdate,
        locale: locale ?? _locale,
        timezone: timezone ?? _timezone,
        disableWelcomeEmail: disableWelcomeEmail ?? _disableWelcomeEmail,
      );

  String? get id => _id;

  String? get token => _token;

  num? get createAt => _createAt;

  num? get updateAt => _updateAt;

  num? get deleteAt => _deleteAt;

  String? get username => _username;

  String? get authData => _authData;

  String? get authService => _authService;

  String? get email => _email;

  String? get nickname => _nickname;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get position => _position;

  String? get roles => _roles;

  bool? get allowMarketing => _allowMarketing;

  NotifyProps? get notifyProps => _notifyProps;

  num? get lastPasswordUpdate => _lastPasswordUpdate;

  String? get locale => _locale;

  Timezone? get timezone => _timezone;

  bool? get disableWelcomeEmail => _disableWelcomeEmail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['create_at'] = _createAt;
    map['update_at'] = _updateAt;
    map['delete_at'] = _deleteAt;
    map['username'] = _username;
    map['auth_data'] = _authData;
    map['auth_service'] = _authService;
    map['email'] = _email;
    map['nickname'] = _nickname;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['position'] = _position;
    map['roles'] = _roles;
    map['allow_marketing'] = _allowMarketing;
    if (_notifyProps != null) {
      map['notify_props'] = _notifyProps?.toJson();
    }
    map['last_password_update'] = _lastPasswordUpdate;
    map['locale'] = _locale;
    if (_timezone != null) {
      map['timezone'] = _timezone?.toJson();
    }
    map['disable_welcome_email'] = _disableWelcomeEmail;
    return map;
  }

  @override
  String toString() {
    return 'LoginRequest{_id: $_id, _token: $_token, _createAt: $_createAt, _updateAt: $_updateAt, _deleteAt: $_deleteAt, _username: $_username, _authData: $_authData, _authService: $_authService, _email: $_email, _nickname: $_nickname, _firstName: $_firstName, _lastName: $_lastName, _position: $_position, _roles: $_roles, _allowMarketing: $_allowMarketing, _notifyProps: $_notifyProps, _lastPasswordUpdate: $_lastPasswordUpdate, _locale: $_locale, _timezone: $_timezone, _disableWelcomeEmail: $_disableWelcomeEmail}';
  }
}

/// automaticTimezone : "Asia/Tehran"
/// manualTimezone : ""
/// useAutomaticTimezone : "true"

class Timezone {
  Timezone({
    String? automaticTimezone,
    String? manualTimezone,
    String? useAutomaticTimezone,
  }) {
    _automaticTimezone = automaticTimezone;
    _manualTimezone = manualTimezone;
    _useAutomaticTimezone = useAutomaticTimezone;
  }

  Timezone.fromJson(dynamic json) {
    _automaticTimezone = json['automaticTimezone'];
    _manualTimezone = json['manualTimezone'];
    _useAutomaticTimezone = json['useAutomaticTimezone'];
  }

  String? _automaticTimezone;
  String? _manualTimezone;
  String? _useAutomaticTimezone;

  Timezone copyWith({
    String? automaticTimezone,
    String? manualTimezone,
    String? useAutomaticTimezone,
  }) =>
      Timezone(
        automaticTimezone: automaticTimezone ?? _automaticTimezone,
        manualTimezone: manualTimezone ?? _manualTimezone,
        useAutomaticTimezone: useAutomaticTimezone ?? _useAutomaticTimezone,
      );

  String? get automaticTimezone => _automaticTimezone;

  String? get manualTimezone => _manualTimezone;

  String? get useAutomaticTimezone => _useAutomaticTimezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['automaticTimezone'] = _automaticTimezone;
    map['manualTimezone'] = _manualTimezone;
    map['useAutomaticTimezone'] = _useAutomaticTimezone;
    return map;
  }

  @override
  String toString() {
    return 'Timezone{_automaticTimezone: $_automaticTimezone, _manualTimezone: $_manualTimezone, _useAutomaticTimezone: $_useAutomaticTimezone}';
  }
}

/// channel : "true"
/// comments : "never"
/// desktop : "mention"
/// desktop_sound : "true"
/// desktop_threads : "all"
/// email : "true"
/// email_threads : "all"
/// first_name : "false"
/// mention_keys : ""
/// push : "mention"
/// push_status : "away"
/// push_threads : "all"

class NotifyProps {
  NotifyProps({
    String? channel,
    String? comments,
    String? desktop,
    String? desktopSound,
    String? desktopThreads,
    String? email,
    String? emailThreads,
    String? firstName,
    String? mentionKeys,
    String? push,
    String? pushStatus,
    String? pushThreads,
  }) {
    _channel = channel;
    _comments = comments;
    _desktop = desktop;
    _desktopSound = desktopSound;
    _desktopThreads = desktopThreads;
    _email = email;
    _emailThreads = emailThreads;
    _firstName = firstName;
    _mentionKeys = mentionKeys;
    _push = push;
    _pushStatus = pushStatus;
    _pushThreads = pushThreads;
  }

  NotifyProps.fromJson(dynamic json) {
    _channel = json['channel'];
    _comments = json['comments'];
    _desktop = json['desktop'];
    _desktopSound = json['desktop_sound'];
    _desktopThreads = json['desktop_threads'];
    _email = json['email'];
    _emailThreads = json['email_threads'];
    _firstName = json['first_name'];
    _mentionKeys = json['mention_keys'];
    _push = json['push'];
    _pushStatus = json['push_status'];
    _pushThreads = json['push_threads'];
  }

  String? _channel;
  String? _comments;
  String? _desktop;
  String? _desktopSound;
  String? _desktopThreads;
  String? _email;
  String? _emailThreads;
  String? _firstName;
  String? _mentionKeys;
  String? _push;
  String? _pushStatus;
  String? _pushThreads;

  NotifyProps copyWith({
    String? channel,
    String? comments,
    String? desktop,
    String? desktopSound,
    String? desktopThreads,
    String? email,
    String? emailThreads,
    String? firstName,
    String? mentionKeys,
    String? push,
    String? pushStatus,
    String? pushThreads,
  }) =>
      NotifyProps(
        channel: channel ?? _channel,
        comments: comments ?? _comments,
        desktop: desktop ?? _desktop,
        desktopSound: desktopSound ?? _desktopSound,
        desktopThreads: desktopThreads ?? _desktopThreads,
        email: email ?? _email,
        emailThreads: emailThreads ?? _emailThreads,
        firstName: firstName ?? _firstName,
        mentionKeys: mentionKeys ?? _mentionKeys,
        push: push ?? _push,
        pushStatus: pushStatus ?? _pushStatus,
        pushThreads: pushThreads ?? _pushThreads,
      );

  String? get channel => _channel;

  String? get comments => _comments;

  String? get desktop => _desktop;

  String? get desktopSound => _desktopSound;

  String? get desktopThreads => _desktopThreads;

  String? get email => _email;

  String? get emailThreads => _emailThreads;

  String? get firstName => _firstName;

  String? get mentionKeys => _mentionKeys;

  String? get push => _push;

  String? get pushStatus => _pushStatus;

  String? get pushThreads => _pushThreads;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channel'] = _channel;
    map['comments'] = _comments;
    map['desktop'] = _desktop;
    map['desktop_sound'] = _desktopSound;
    map['desktop_threads'] = _desktopThreads;
    map['email'] = _email;
    map['email_threads'] = _emailThreads;
    map['first_name'] = _firstName;
    map['mention_keys'] = _mentionKeys;
    map['push'] = _push;
    map['push_status'] = _pushStatus;
    map['push_threads'] = _pushThreads;
    return map;
  }

  @override
  String toString() {
    return 'NotifyProps{_channel: $_channel, _comments: $_comments, _desktop: $_desktop, _desktopSound: $_desktopSound, _desktopThreads: $_desktopThreads, _email: $_email, _emailThreads: $_emailThreads, _firstName: $_firstName, _mentionKeys: $_mentionKeys, _push: $_push, _pushStatus: $_pushStatus, _pushThreads: $_pushThreads}';
  }
}
