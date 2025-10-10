class StandingModel {
  final String? filegroup;
  final String? leaguename;
  final List<Group> groups;
  final int? updatedFromFeedAt;
  final String? feedTimestamp;
  final bool? useLiveTableCalculation;
  final String? lastUpdated;
  final int? updatedFromFeed;
  final String? season;
  final int? updatedFromMatches;
  final List<GroupsInfo> groupsInfo;

  StandingModel({
    this.filegroup,
    this.leaguename,
    this.groups = const [],
    this.updatedFromFeedAt,
    this.feedTimestamp,
    this.useLiveTableCalculation,
    this.lastUpdated,
    this.updatedFromFeed,
    this.season,
    this.updatedFromMatches,
    this.groupsInfo = const [],
  });

  factory StandingModel.fromJson(Map<String, dynamic> json) => StandingModel(
        filegroup: json["filegroup"],
        leaguename: json["leaguename"],
        groups: json["groups"] == null ? [] : List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
        updatedFromFeedAt: json["updated_from_feed_at"],
        feedTimestamp: json["feed_timestamp"],
        useLiveTableCalculation: json["useLiveTableCalculation"],
        lastUpdated: json["lastUpdated"],
        updatedFromFeed: json["updatedFromFeed"],
        season: json["season"],
        updatedFromMatches: json["updatedFromMatches"],
        groupsInfo: json["groupsInfo"] == null ? [] : List<GroupsInfo>.from(json["groupsInfo"].map((x) => GroupsInfo.fromJson(x))),
      );
}

class Group {
  final String? group;
  final String? round;
  final String? stageid;
  final String? leaugeid;
  final String? season;
  final int? isCurrent;
  final String? league;
  final String? country;
  final List<Team> teams;

  Group({
    this.group,
    this.round,
    this.stageid,
    this.leaugeid,
    this.season,
    this.isCurrent,
    this.league,
    this.country,
    this.teams = const [],
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        group: json["group"],
        round: json["round"],
        stageid: json["stageid"],
        leaugeid: json["leaugeid"],
        season: json["season"],
        isCurrent: json["is_current"],
        league: json["league"],
        country: json["country"],
        teams: json["teams"] == null ? [] : List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
      );
}

class Team {
  final String? idSw;
  final String? idGs;
  final String? status;
  final String? recentForm;
  final String? rank;
  final String? position;
  final String? team;
  final String? group;
  final String? round;
  final String? league;
  final String? season;
  final String? matchPoints;
  final String? totalWon;
  final String? totalDraw;
  final String? totalLost;
  final String? totalGoalsFor;
  final String? totalGoalsAgainst;
  final String? goalDifference;
  final String? points;
  final String? description;
  final String? cc;
  final String? matchPointsOrg;
  final String? orgFeedPoints;
  final String? orgPoints;
  final String? pointsOrg;
  final String? totalGoalsForOrg;
  final String? totalGoalsAgainstOrg;
  final String? goalDifferenceOrg;
  final String? totalWonOrg;
  final String? totalLostOrg;
  final String? totalDrawOrg;
  final String? positionOrg;
  final String? updatedFrom;
  final String? color;
  final int? colorIndex;
  final int? fromPreviousUsage;
  final String? colorType;
  final String? descriptionV2;

  Team({
    this.idSw,
    this.idGs,
    this.status,
    this.recentForm,
    this.rank,
    this.position,
    this.team,
    this.group,
    this.round,
    this.league,
    this.season,
    this.matchPoints,
    this.totalWon,
    this.totalDraw,
    this.totalLost,
    this.totalGoalsFor,
    this.totalGoalsAgainst,
    this.goalDifference,
    this.points,
    this.description,
    this.cc,
    this.matchPointsOrg,
    this.orgFeedPoints,
    this.orgPoints,
    this.pointsOrg,
    this.totalGoalsForOrg,
    this.totalGoalsAgainstOrg,
    this.goalDifferenceOrg,
    this.totalWonOrg,
    this.totalLostOrg,
    this.totalDrawOrg,
    this.positionOrg,
    this.updatedFrom,
    this.color,
    this.colorIndex,
    this.fromPreviousUsage,
    this.colorType,
    this.descriptionV2,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        idSw: json["id_sw"],
        idGs: json["id_gs"],
        status: json["status"],
        recentForm: json["recentForm"],
        rank: json["rank"],
        position: json["position"],
        team: json["team"],
        group: json["group"],
        round: json["round"],
        league: json["league"],
        season: json["season"],
        matchPoints: json["matchPoints"],
        totalWon: json["totalWon"],
        totalDraw: json["totalDraw"],
        totalLost: json["totalLost"],
        totalGoalsFor: json["totalGoalsFor"],
        totalGoalsAgainst: json["totalGoalsAgainst"],
        goalDifference: json["goalDifference"],
        points: json["points"],
        description: json["description"],
        cc: json["cc"],
        matchPointsOrg: json["matchPoints_org"],
        orgFeedPoints: json["org_feed_points"],
        orgPoints: json["org_points"],
        pointsOrg: json["points_org"],
        totalGoalsForOrg: json["totalGoalsFor_org"],
        totalGoalsAgainstOrg: json["totalGoalsAgainst_org"],
        goalDifferenceOrg: json["goalDifference_org"],
        totalWonOrg: json["totalWon_org"],
        totalLostOrg: json["totalLost_org"],
        totalDrawOrg: json["totalDraw_org"],
        positionOrg: json["position_org"],
        updatedFrom: json["updatedFrom"],
        color: json["color"],
        colorIndex: json["colorIndex"],
        fromPreviousUsage: json["fromPreviousUsage"],
        colorType: json["colorType"],
        descriptionV2: json["description_v2"],
      );
}

class GroupsInfo {
  final int? descriptionCount;
  final List<dynamic>? indexInfo;
  final List<dynamic>? descriptionStartEndIndices;

  GroupsInfo({
    this.descriptionCount,
    this.indexInfo,
    this.descriptionStartEndIndices,
  });

  factory GroupsInfo.fromJson(Map<String, dynamic> json) => GroupsInfo(
        descriptionCount: json["descriptionCount"],
        indexInfo: json["indexInfo"] == null ? null : List<dynamic>.from(json["indexInfo"]),
        descriptionStartEndIndices: json["descriptionStartEndIndices"] == null ? null : List<dynamic>.from(json["descriptionStartEndIndices"]),
      );
}
