class UserTeams {
  UserTeams({
    this.id,
    this.createAt,
    this.updateAt,
    this.deleteAt,
    this.displayName,
    this.name,
    this.description,
    this.email,
    this.type,
    this.companyName,
    this.allowedDomains,
    this.inviteId,
    this.allowOpenInvite,
    this.lastTeamIconUpdate,
    this.schemeId,
    this.groupConstrained,
    this.policyId,
    this.cloudLimitsArchived,
  });

  UserTeams.fromJson(dynamic json) {
    id = json['id'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    deleteAt = json['delete_at'];
    displayName = json['display_name'];
    name = json['name'];
    description = json['description'];
    email = json['email'];
    type = json['type'];
    companyName = json['company_name'];
    allowedDomains = json['allowed_domains'];
    inviteId = json['invite_id'];
    allowOpenInvite = json['allow_open_invite'];
    lastTeamIconUpdate = json['last_team_icon_update'];
    schemeId = json['scheme_id'];
    groupConstrained = json['group_constrained'];
    policyId = json['policy_id'];
    cloudLimitsArchived = json['cloud_limits_archived'];
  }

  String? id;
  int? createAt;
  int? updateAt;
  int? deleteAt;
  String? displayName;
  String? name;
  String? description;
  String? email;
  String? type;
  String? companyName;
  String? allowedDomains;
  String? inviteId;
  bool? allowOpenInvite;
  int? lastTeamIconUpdate;
  dynamic? schemeId;
  dynamic? groupConstrained;
  dynamic? policyId;
  bool? cloudLimitsArchived;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['create_at'] = createAt;
    map['update_at'] = updateAt;
    map['delete_at'] = deleteAt;
    map['display_name'] = displayName;
    map['name'] = name;
    map['description'] = description;
    map['email'] = email;
    map['type'] = type;
    map['company_name'] = companyName;
    map['allowed_domains'] = allowedDomains;
    map['invite_id'] = inviteId;
    map['allow_open_invite'] = allowOpenInvite;
    map['last_team_icon_update'] = lastTeamIconUpdate;
    map['scheme_id'] = schemeId;
    map['group_constrained'] = groupConstrained;
    map['policy_id'] = policyId;
    map['cloud_limits_archived'] = cloudLimitsArchived;
    return map;
  }

  @override
  String toString() {
    return 'UserTeams{id: $id, createAt: $createAt, updateAt: $updateAt, deleteAt: $deleteAt, displayName: $displayName, name: $name, description: $description, email: $email, type: $type, companyName: $companyName, allowedDomains: $allowedDomains, inviteId: $inviteId, allowOpenInvite: $allowOpenInvite, lastTeamIconUpdate: $lastTeamIconUpdate, schemeId: $schemeId, groupConstrained: $groupConstrained, policyId: $policyId, cloudLimitsArchived: $cloudLimitsArchived}';
  }
}
