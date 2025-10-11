import 'dart:convert';
import 'package:flutter/material.dart';

TeamDetailsModel teamDetailsModelFromJson(String str) =>
    TeamDetailsModel.fromJson(json.decode(str));

String teamDetailsModelToJson(TeamDetailsModel data) =>
    json.encode(data.toJson());

class TeamDetailsModel {
  final String? idGs;
  final String? teamname;
  final String? country;
  final String? venuecity;
  final String? venue;
  final String? venueid;
  final String? venuesurface;
  final String? venuecapacity;
  final String? venueaddress;
  final String? founded;
  final List<Squad> squad;
  final Transfers? transfers;
  final Stats? stats;
  final String? lastUpdated;
  final List<Fixture> fixtures;
  final List<LeagueElement> leagues;
  final String? shape;
  final List<String> shapeFixtures;
  final List<String> override;
  final String? city;
  final String? url;
  final List<Trophy> trophies;
  final dynamic coachbirthcountry;
  final int? lastCoachUpdateTs;
  final List<Sidelined> sidelined;
  final dynamic coachnationality;
  final String? coachid;
  final String? coach;
  final String? fullname;

  TeamDetailsModel({
    this.idGs,
    this.teamname,
    this.country,
    this.venuecity,
    this.venue,
    this.venueid,
    this.venuesurface,
    this.venuecapacity,
    this.venueaddress,
    this.founded,
    this.squad = const [],
    this.transfers,
    this.stats,
    this.lastUpdated,
    this.fixtures = const [],
    this.leagues = const [],
    this.shape,
    this.shapeFixtures = const [],
    this.override = const [],
    this.city,
    this.url,
    this.trophies = const [],
    this.coachbirthcountry,
    this.lastCoachUpdateTs,
    this.sidelined = const [],
    this.coachnationality,
    this.coachid,
    this.coach,
    this.fullname,
  });

  factory TeamDetailsModel.fromJson(Map<String, dynamic> json) {
    try {
      return TeamDetailsModel(
        idGs: json["id_gs"],
        teamname: json["teamname"],
        country: json["country"],
        venuecity: json["venuecity"],
        venue: json["venue"],
        venueid: json["venueid"],
        venuesurface: json["venuesurface"],
        venuecapacity: json["venuecapacity"],
        venueaddress: json["venueaddress"],
        founded: json["founded"],
        squad: json["squad"] == null
            ? []
            : List<Squad>.from(json["squad"].map((x) => Squad.fromJson(x))),
        transfers: json["transfers"] == null
            ? null
            : Transfers.fromJson(json["transfers"]),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        lastUpdated: json["lastUpdated"],
        fixtures: json["fixtures"] == null
            ? []
            : List<Fixture>.from(
                json["fixtures"].map((x) => Fixture.fromJson(x)),
              ),
        leagues: json["leagues"] == null
            ? []
            : List<LeagueElement>.from(
                json["leagues"].map((x) => LeagueElement.fromJson(x)),
              ),
        shape: json["shape"],
        shapeFixtures: json["shape_fixtures"] == null
            ? []
            : List<String>.from(json["shape_fixtures"].map((x) => x)),
        override: json["override"] == null
            ? []
            : List<String>.from(json["override"].map((x) => x)),
        city: json["city"],
        url: json["url"],
        trophies: json["trophies"] == null
            ? []
            : List<Trophy>.from(
                json["trophies"].map((x) => Trophy.fromJson(x)),
              ),
        coachbirthcountry: json["coachbirthcountry"],
        lastCoachUpdateTs: json["last_coach_update_ts"],
        sidelined: json["sidelined"] == null
            ? []
            : List<Sidelined>.from(
                json["sidelined"].map((x) => Sidelined.fromJson(x)),
              ),
        coachnationality: json["coachnationality"],
        coachid: json["coachid"],
        coach: json["coach"],
        fullname: json["fullname"],
      );
    } catch (e, st) {
      debugPrint('Error parsing team details: $e $st');
      throw Exception();
    }
  }

  Map<String, dynamic> toJson() => {
    "id_gs": idGs,
    "teamname": teamname,
    "country": country,
    "venuecity": venuecity,
    "venue": venue,
    "venueid": venueid,
    "venuesurface": venuesurface,
    "venuecapacity": venuecapacity,
    "venueaddress": venueaddress,
    "founded": founded,
    "squad": squad.isEmpty
        ? []
        : List<dynamic>.from((squad).map((x) => x.toJson())),
    "transfers": transfers?.toJson(),
    "stats": stats?.toJson(),
    "lastUpdated": lastUpdated,
    "fixtures": fixtures.isEmpty
        ? []
        : List<dynamic>.from(fixtures.map((x) => x.toJson())),
    "leagues": leagues.isEmpty
        ? []
        : List<dynamic>.from((leagues).map((x) => x.toJson())),
    "shape": shape,
    "shape_fixtures": shapeFixtures.isEmpty
        ? []
        : List<dynamic>.from(shapeFixtures.map((x) => x)),
    "override": override.isEmpty
        ? []
        : List<dynamic>.from(override.map((x) => x)),
    "city": city,
    "url": url,
    "trophies": trophies.isEmpty
        ? []
        : List<dynamic>.from(trophies.map((x) => x.toJson())),
    "coachbirthcountry": coachbirthcountry,
    "last_coach_update_ts": lastCoachUpdateTs,
    "sidelined": sidelined.isEmpty
        ? []
        : List<dynamic>.from(sidelined.map((x) => x.toJson())),
    "coachnationality": coachnationality,
    "coachid": coachid,
    "coach": coach,
    "fullname": fullname,
  };
}

class Fixture {
  final String? id;
  final String? time;
  final String? status;
  final String? gsVisitorteamid;
  final String? gsLocalteamid;
  final String? localteamid;
  final String? visitorteamid;
  final String? date;
  final String? scoretime;
  final int? isOt;
  final String? referee;
  final String? localteam;
  final String? visitorteam;
  final String? leagueid;
  final String? leaguename;
  final String? filegroup;
  final String? stageId;
  final String? leagueKey;
  final int? hi;
  final int? hasOdd;
  final String? localteamshape;
  final String? visitorteamshape;
  final String? coachLocal;
  final String? coachVisitor;
  final String? coachLocalId;
  final String? coachVisitorId;
  final String? injuryminute;
  final String? injurytime;
  final String? addedTimePeriod1;
  final String? addedTimePeriod2;
  final int? visitorteamrc;
  final int? isEt;
  final String? gsLeaguename;
  final String? gsFilegroup;

  Fixture({
    this.id,
    this.time,
    this.status,
    this.gsVisitorteamid,
    this.gsLocalteamid,
    this.localteamid,
    this.visitorteamid,
    this.date,
    this.scoretime,
    this.isOt,
    this.referee,
    this.localteam,
    this.visitorteam,
    this.leagueid,
    this.leaguename,
    this.filegroup,
    this.stageId,
    this.leagueKey,
    this.hi,
    this.hasOdd,
    this.localteamshape,
    this.visitorteamshape,
    this.coachLocal,
    this.coachVisitor,
    this.coachLocalId,
    this.coachVisitorId,
    this.injuryminute,
    this.injurytime,
    this.addedTimePeriod1,
    this.addedTimePeriod2,
    this.visitorteamrc,
    this.isEt,
    this.gsLeaguename,
    this.gsFilegroup,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
    id: json["id"],
    time: json["time"],
    status: json["status"],
    gsVisitorteamid: json["gs_visitorteamid"],
    gsLocalteamid: json["gs_localteamid"],
    localteamid: json["localteamid"],
    visitorteamid: json["visitorteamid"],
    date: json["date"],
    scoretime: json["scoretime"],
    isOt: json["isOT"],
    referee: json["referee"],
    localteam: json["localteam"],
    visitorteam: json["visitorteam"],
    leagueid: json["leagueid"],
    leaguename: json["leaguename"],
    filegroup: json["filegroup"],
    stageId: json["stageId"],
    leagueKey: json["leagueKey"],
    hi: json["hi"],
    hasOdd: json["hasOdd"],
    localteamshape: json["localteamshape"],
    visitorteamshape: json["visitorteamshape"],
    coachLocal: json["coachLocal"],
    coachVisitor: json["coachVisitor"],
    coachLocalId: json["coachLocalId"],
    coachVisitorId: json["coachVisitorId"],
    injuryminute: json["injuryminute"],
    injurytime: json["injurytime"],
    addedTimePeriod1: json["addedTime_period1"],
    addedTimePeriod2: json["addedTime_period2"],
    visitorteamrc: json["visitorteamrc"],
    isEt: json["isET"],
    gsLeaguename: json["gs_leaguename"],
    gsFilegroup: json["gs_filegroup"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "time": time,
    "status": status,
    "gs_visitorteamid": gsVisitorteamid,
    "gs_localteamid": gsLocalteamid,
    "localteamid": localteamid,
    "visitorteamid": visitorteamid,
    "date": date,
    "scoretime": scoretime,
    "isOT": isOt,
    "referee": referee,
    "localteam": localteam,
    "visitorteam": visitorteam,
    "leagueid": leagueid,
    "leaguename": leaguename,
    "filegroup": filegroup,
    "stageId": stageId,
    "leagueKey": leagueKey,
    "hi": hi,
    "hasOdd": hasOdd,
    "localteamshape": localteamshape,
    "visitorteamshape": visitorteamshape,
    "coachLocal": coachLocal,
    "coachVisitor": coachVisitor,
    "coachLocalId": coachLocalId,
    "coachVisitorId": coachVisitorId,
    "injuryminute": injuryminute,
    "injurytime": injurytime,
    "addedTime_period1": addedTimePeriod1,
    "addedTime_period2": addedTimePeriod2,
    "visitorteamrc": visitorteamrc,
    "isET": isEt,
    "gs_leaguename": gsLeaguename,
    "gs_filegroup": gsFilegroup,
  };
}

class LeagueElement {
  final String? country;
  final String? league;
  final String? key;
  final String? position;
  final String? round;
  final Table? table;

  LeagueElement({
    this.country,
    this.league,
    this.key,
    this.position,
    this.round,
    this.table,
  });

  factory LeagueElement.fromJson(Map<String, dynamic> json) => LeagueElement(
    country: json["country"],
    league: json["league"],
    key: json["key"],
    position: json["position"],
    round: json["round"],
    table: json["table"] == null ? null : Table.fromJson(json["table"]),
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "league": league,
    "key": key,
    "position": position,
    "round": round,
    "table": table?.toJson(),
  };
}

class Table {
  final String? filegroup;
  final String? leaguename;
  final List<GroupElement> groups;
  final int? updatedFromFeedAt;
  final String? feedTimestamp;
  final bool? useLiveTableCalculation;
  final String? lastUpdated;
  final int? updatedFromFeed;
  final String? season;
  final int? updatedFromMatches;
  final List<GroupsInfo> groupsInfo;

  Table({
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

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    filegroup: json["filegroup"],
    leaguename: json["leaguename"],
    groups: json["groups"] == null
        ? []
        : List<GroupElement>.from(
            json["groups"].map((x) => GroupElement.fromJson(x)),
          ),
    updatedFromFeedAt: json["updated_from_feed_at"],
    feedTimestamp: json["feed_timestamp"],
    useLiveTableCalculation: json["useLiveTableCalculation"],
    lastUpdated: json["lastUpdated"],
    updatedFromFeed: json["updatedFromFeed"],
    season: json["season"],
    updatedFromMatches: json["updatedFromMatches"],
    groupsInfo: json["groupsInfo"] == null
        ? []
        : List<GroupsInfo>.from(
            json["groupsInfo"].map((x) => GroupsInfo.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "filegroup": filegroup,
    "leaguename": leaguename,
    "groups": groups.isEmpty
        ? []
        : List<dynamic>.from(groups.map((x) => x.toJson())),
    "updated_from_feed_at": updatedFromFeedAt,
    "feed_timestamp": feedTimestamp,
    "useLiveTableCalculation": useLiveTableCalculation,
    "lastUpdated": lastUpdated,
    "updatedFromFeed": updatedFromFeed,
    "season": season,
    "updatedFromMatches": updatedFromMatches,
    "groupsInfo": groupsInfo.isEmpty
        ? []
        : List<dynamic>.from(groupsInfo.map((x) => x.toJson())),
  };
}

class GroupElement {
  final String? group;
  final String? round;
  final String? stageid;
  final String? leaugeid;
  final String? season;
  final int? isCurrent;
  final String? league;
  final String? country;
  final List<Team> teams;

  GroupElement({
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

  factory GroupElement.fromJson(Map<String, dynamic> json) => GroupElement(
    group: json["group"],
    round: json["round"],
    stageid: json["stageid"],
    leaugeid: json["leaugeid"],
    season: json["season"],
    isCurrent: json["is_current"],
    league: json["league"],
    country: json["country"],
    teams: json["teams"] == null
        ? []
        : List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "group": group,
    "round": round,
    "stageid": stageid,
    "leaugeid": leaugeid,
    "season": season,
    "is_current": isCurrent,
    "league": league,
    "country": country,
    "teams": teams.isEmpty
        ? []
        : List<dynamic>.from(teams.map((x) => x.toJson())),
  };
}

class Team {
  final dynamic idSw;
  final String? idGs;
  final String? status;
  final String? recentForm;
  final String? rank;
  final String? position;
  final String? team;
  final String? group;
  final String? round;
  final String? league;
  final dynamic season;
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
  final int? updatedFromFeed;
  final String? color;
  final int? colorIndex;
  final String? colorType;
  final String? descriptionV2;
  final int? fromPreviousUsage;

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
    this.updatedFromFeed,
    this.color,
    this.colorIndex,
    this.colorType,
    this.descriptionV2,
    this.fromPreviousUsage,
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
    updatedFromFeed: json["updatedFromFeed"],
    color: json["color"],
    colorIndex: json["colorIndex"],
    colorType: json["colorType"],
    descriptionV2: json["description_v2"],
    fromPreviousUsage: json["fromPreviousUsage"],
  );

  Map<String, dynamic> toJson() => {
    "id_sw": idSw,
    "id_gs": idGs,
    "status": status,
    "recentForm": recentForm,
    "rank": rank,
    "position": position,
    "team": team,
    "group": group,
    "round": round,
    "league": league,
    "season": season,
    "matchPoints": matchPoints,
    "totalWon": totalWon,
    "totalDraw": totalDraw,
    "totalLost": totalLost,
    "totalGoalsFor": totalGoalsFor,
    "totalGoalsAgainst": totalGoalsAgainst,
    "goalDifference": goalDifference,
    "points": points,
    "description": description,
    "cc": cc,
    "matchPoints_org": matchPointsOrg,
    "org_feed_points": orgFeedPoints,
    "org_points": orgPoints,
    "points_org": pointsOrg,
    "totalGoalsFor_org": totalGoalsForOrg,
    "totalGoalsAgainst_org": totalGoalsAgainstOrg,
    "goalDifference_org": goalDifferenceOrg,
    "totalWon_org": totalWonOrg,
    "totalLost_org": totalLostOrg,
    "totalDraw_org": totalDrawOrg,
    "position_org": positionOrg,
    "updatedFrom": updatedFrom,
    "updatedFromFeed": updatedFromFeed,
    "color": color,
    "colorIndex": colorIndex,
    "colorType": colorType,
    "description_v2": descriptionV2,
    "fromPreviousUsage": fromPreviousUsage,
  };
}

class GroupsInfo {
  final int? descriptionCount;
  final List<dynamic> indexInfo;
  final List<dynamic> descriptionStartEndIndices;

  GroupsInfo({
    this.descriptionCount,
    this.indexInfo = const [],
    this.descriptionStartEndIndices = const [],
  });

  factory GroupsInfo.fromJson(Map<String, dynamic> json) => GroupsInfo(
    descriptionCount: json["descriptionCount"],
    indexInfo: json["indexInfo"] == null
        ? []
        : List<dynamic>.from(json["indexInfo"].map((x) => x)),
    descriptionStartEndIndices: json["descriptionStartEndIndices"] == null
        ? []
        : List<dynamic>.from(json["descriptionStartEndIndices"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "descriptionCount": descriptionCount,
    "indexInfo": indexInfo.isEmpty
        ? []
        : List<dynamic>.from(indexInfo.map((x) => x)),
    "descriptionStartEndIndices": descriptionStartEndIndices.isEmpty
        ? []
        : List<dynamic>.from(descriptionStartEndIndices.map((x) => x)),
  };
}

class Sidelined {
  final String? id;
  final String? name;
  final String? description;
  final String? startdate;
  final String? enddate;

  Sidelined({
    this.id,
    this.name,
    this.description,
    this.startdate,
    this.enddate,
  });

  factory Sidelined.fromJson(Map<String, dynamic> json) => Sidelined(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    startdate: json["startdate"],
    enddate: json["enddate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "startdate": startdate,
    "enddate": enddate,
  };
}

class Squad {
  final String? id;
  final String? name;
  final String? number;
  final String? age;
  final String? position;
  final String? injured;
  final String? minutes;
  final String? appearences;
  final String? lineups;
  final String? substituteIn;
  final String? substituteOut;
  final String? substitutesOnBench;
  final String? goals;
  final String? yellowcards;
  final String? yellowred;
  final String? redcards;
  final String? isCaptain;
  final String? rating;
  final String? shotsTotal;
  final String? goalsConceded;
  final String? fouldDrawn;
  final String? foulsCommitted;
  final String? tackles;
  final String? blocks;
  final String? crossesTotal;
  final String? crossesAccurate;
  final String? interceptions;
  final String? clearances;
  final String? dispossesed;
  final String? saves;
  final String? insideBoxSaves;
  final String? duelsTotal;
  final String? duelsWon;
  final String? dribbleAttempts;
  final String? dribbleSucc;
  final String? penComm;
  final String? penWon;
  final String? penScored;
  final String? penMissed;
  final String? penSaved;
  final String? passes;
  final String? pAccuracy;
  final String? keyPasses;
  final String? woordworks;
  final String? nationality;
  final String? birthcountry;

  Squad({
    this.id,
    this.name,
    this.number,
    this.age,
    this.position,
    this.injured,
    this.minutes,
    this.appearences,
    this.lineups,
    this.substituteIn,
    this.substituteOut,
    this.substitutesOnBench,
    this.goals,
    this.yellowcards,
    this.yellowred,
    this.redcards,
    this.isCaptain,
    this.rating,
    this.shotsTotal,
    this.goalsConceded,
    this.fouldDrawn,
    this.foulsCommitted,
    this.tackles,
    this.blocks,
    this.crossesTotal,
    this.crossesAccurate,
    this.interceptions,
    this.clearances,
    this.dispossesed,
    this.saves,
    this.insideBoxSaves,
    this.duelsTotal,
    this.duelsWon,
    this.dribbleAttempts,
    this.dribbleSucc,
    this.penComm,
    this.penWon,
    this.penScored,
    this.penMissed,
    this.penSaved,
    this.passes,
    this.pAccuracy,
    this.keyPasses,
    this.woordworks,
    this.nationality,
    this.birthcountry,
  });

  factory Squad.fromJson(Map<String, dynamic> json) => Squad(
    id: json["id"],
    name: json["name"],
    number: json["number"],
    age: json["age"],
    position: json["position"],
    injured: json["injured"],
    minutes: json["minutes"],
    appearences: json["appearences"],
    lineups: json["lineups"],
    substituteIn: json["substitute_in"],
    substituteOut: json["substitute_out"],
    substitutesOnBench: json["substitutes_on_bench"],
    goals: json["goals"],
    yellowcards: json["yellowcards"],
    yellowred: json["yellowred"],
    redcards: json["redcards"],
    isCaptain: json["isCaptain"],
    rating: json["rating"],
    shotsTotal: json["shotsTotal"],
    goalsConceded: json["goalsConceded"],
    fouldDrawn: json["fouldDrawn"],
    foulsCommitted: json["foulsCommitted"],
    tackles: json["tackles"],
    blocks: json["blocks"],
    crossesTotal: json["crossesTotal"],
    crossesAccurate: json["crossesAccurate"],
    interceptions: json["interceptions"],
    clearances: json["clearances"],
    dispossesed: json["dispossesed"],
    saves: json["saves"],
    insideBoxSaves: json["insideBoxSaves"],
    duelsTotal: json["duelsTotal"],
    duelsWon: json["duelsWon"],
    dribbleAttempts: json["dribbleAttempts"],
    dribbleSucc: json["dribbleSucc"],
    penComm: json["penComm"],
    penWon: json["penWon"],
    penScored: json["penScored"],
    penMissed: json["penMissed"],
    penSaved: json["penSaved"],
    passes: json["passes"],
    pAccuracy: json["pAccuracy"],
    keyPasses: json["keyPasses"],
    woordworks: json["woordworks"],
    nationality: json["nationality"],
    birthcountry: json["birthcountry"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "number": number,
    "age": age,
    "position": position,
    "injured": injured,
    "minutes": minutes,
    "appearences": appearences,
    "lineups": lineups,
    "substitute_in": substituteIn,
    "substitute_out": substituteOut,
    "substitutes_on_bench": substitutesOnBench,
    "goals": goals,
    "yellowcards": yellowcards,
    "yellowred": yellowred,
    "redcards": redcards,
    "isCaptain": isCaptain,
    "rating": rating,
    "shotsTotal": shotsTotal,
    "goalsConceded": goalsConceded,
    "fouldDrawn": fouldDrawn,
    "foulsCommitted": foulsCommitted,
    "tackles": tackles,
    "blocks": blocks,
    "crossesTotal": crossesTotal,
    "crossesAccurate": crossesAccurate,
    "interceptions": interceptions,
    "clearances": clearances,
    "dispossesed": dispossesed,
    "saves": saves,
    "insideBoxSaves": insideBoxSaves,
    "duelsTotal": duelsTotal,
    "duelsWon": duelsWon,
    "dribbleAttempts": dribbleAttempts,
    "dribbleSucc": dribbleSucc,
    "penComm": penComm,
    "penWon": penWon,
    "penScored": penScored,
    "penMissed": penMissed,
    "penSaved": penSaved,
    "passes": passes,
    "pAccuracy": pAccuracy,
    "keyPasses": keyPasses,
    "woordworks": woordworks,
    "nationality": nationality,
    "birthcountry": birthcountry,
  };
}

class Stats {
  final String? rank;
  final String? winTotal;
  final String? winHome;
  final String? winAway;
  final String? drawTotal;
  final String? drawHome;
  final String? drawAway;
  final String? lostTotal;
  final String? lostHome;
  final String? lostAway;
  final String? goalsForTotal;
  final String? goalsForHome;
  final String? goalsForAway;
  final String? goalsAgainstTotal;
  final String? goalsAgainstHome;
  final String? goalsAgainstAway;
  final String? cleanSheetTotal;
  final String? cleanSheetHome;
  final String? cleanSheetAway;
  final String? avgGoalsPerGameScoredTotal;
  final String? avgGoalsPerGameScoredHome;
  final String? avgGoalsPerGameScoredAway;
  final String? avgGoalsPerGameConcededTotal;
  final String? avgGoalsPerGameConcededHome;
  final String? avgGoalsPerGameConcededAway;
  final String? avgFirstGoalScoredTotal;
  final String? avgFirstGoalScoredHome;
  final String? avgFirstGoalScoredAway;
  final String? avgFirstGoalConcededTotal;
  final String? avgFirstGoalConcededHome;
  final String? avgFirstGoalConcededAway;
  final String? failedToScoreTotal;
  final String? failedToScoreHome;
  final String? failedToScoreAway;

  Stats({
    this.rank,
    this.winTotal,
    this.winHome,
    this.winAway,
    this.drawTotal,
    this.drawHome,
    this.drawAway,
    this.lostTotal,
    this.lostHome,
    this.lostAway,
    this.goalsForTotal,
    this.goalsForHome,
    this.goalsForAway,
    this.goalsAgainstTotal,
    this.goalsAgainstHome,
    this.goalsAgainstAway,
    this.cleanSheetTotal,
    this.cleanSheetHome,
    this.cleanSheetAway,
    this.avgGoalsPerGameScoredTotal,
    this.avgGoalsPerGameScoredHome,
    this.avgGoalsPerGameScoredAway,
    this.avgGoalsPerGameConcededTotal,
    this.avgGoalsPerGameConcededHome,
    this.avgGoalsPerGameConcededAway,
    this.avgFirstGoalScoredTotal,
    this.avgFirstGoalScoredHome,
    this.avgFirstGoalScoredAway,
    this.avgFirstGoalConcededTotal,
    this.avgFirstGoalConcededHome,
    this.avgFirstGoalConcededAway,
    this.failedToScoreTotal,
    this.failedToScoreHome,
    this.failedToScoreAway,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    rank: json["rank"],
    winTotal: json["winTotal"],
    winHome: json["winHome"],
    winAway: json["winAway"],
    drawTotal: json["drawTotal"],
    drawHome: json["drawHome"],
    drawAway: json["drawAway"],
    lostTotal: json["lostTotal"],
    lostHome: json["lostHome"],
    lostAway: json["lostAway"],
    goalsForTotal: json["goalsForTotal"],
    goalsForHome: json["goalsForHome"],
    goalsForAway: json["goalsForAway"],
    goalsAgainstTotal: json["goalsAgainstTotal"],
    goalsAgainstHome: json["goalsAgainstHome"],
    goalsAgainstAway: json["goalsAgainstAway"],
    cleanSheetTotal: json["cleanSheetTotal"],
    cleanSheetHome: json["cleanSheetHome"],
    cleanSheetAway: json["cleanSheetAway"],
    avgGoalsPerGameScoredTotal: json["avgGoalsPerGameScoredTotal"],
    avgGoalsPerGameScoredHome: json["avgGoalsPerGameScoredHome"],
    avgGoalsPerGameScoredAway: json["avgGoalsPerGameScoredAway"],
    avgGoalsPerGameConcededTotal: json["avgGoalsPerGameConcededTotal"],
    avgGoalsPerGameConcededHome: json["avgGoalsPerGameConcededHome"],
    avgGoalsPerGameConcededAway: json["avgGoalsPerGameConcededAway"],
    avgFirstGoalScoredTotal: json["avgFirstGoalScoredTotal"],
    avgFirstGoalScoredHome: json["avgFirstGoalScoredHome"],
    avgFirstGoalScoredAway: json["avgFirstGoalScoredAway"],
    avgFirstGoalConcededTotal: json["avgFirstGoalConcededTotal"],
    avgFirstGoalConcededHome: json["avgFirstGoalConcededHome"],
    avgFirstGoalConcededAway: json["avgFirstGoalConcededAway"],
    failedToScoreTotal: json["failedToScoreTotal"],
    failedToScoreHome: json["failedToScoreHome"],
    failedToScoreAway: json["failedToScoreAway"],
  );

  Map<String, dynamic> toJson() => {
    "rank": rank,
    "winTotal": winTotal,
    "winHome": winHome,
    "winAway": winAway,
    "drawTotal": drawTotal,
    "drawHome": drawHome,
    "drawAway": drawAway,
    "lostTotal": lostTotal,
    "lostHome": lostHome,
    "lostAway": lostAway,
    "goalsForTotal": goalsForTotal,
    "goalsForHome": goalsForHome,
    "goalsForAway": goalsForAway,
    "goalsAgainstTotal": goalsAgainstTotal,
    "goalsAgainstHome": goalsAgainstHome,
    "goalsAgainstAway": goalsAgainstAway,
    "cleanSheetTotal": cleanSheetTotal,
    "cleanSheetHome": cleanSheetHome,
    "cleanSheetAway": cleanSheetAway,
    "avgGoalsPerGameScoredTotal": avgGoalsPerGameScoredTotal,
    "avgGoalsPerGameScoredHome": avgGoalsPerGameScoredHome,
    "avgGoalsPerGameScoredAway": avgGoalsPerGameScoredAway,
    "avgGoalsPerGameConcededTotal": avgGoalsPerGameConcededTotal,
    "avgGoalsPerGameConcededHome": avgGoalsPerGameConcededHome,
    "avgGoalsPerGameConcededAway": avgGoalsPerGameConcededAway,
    "avgFirstGoalScoredTotal": avgFirstGoalScoredTotal,
    "avgFirstGoalScoredHome": avgFirstGoalScoredHome,
    "avgFirstGoalScoredAway": avgFirstGoalScoredAway,
    "avgFirstGoalConcededTotal": avgFirstGoalConcededTotal,
    "avgFirstGoalConcededHome": avgFirstGoalConcededHome,
    "avgFirstGoalConcededAway": avgFirstGoalConcededAway,
    "failedToScoreTotal": failedToScoreTotal,
    "failedToScoreHome": failedToScoreHome,
    "failedToScoreAway": failedToScoreAway,
  };
}

class Transfers {
  final List<In> transfersIn;
  final List<In> transferOut;

  Transfers({this.transfersIn = const [], this.transferOut = const []});

factory Transfers.fromJson(Map<String, dynamic> json) => Transfers(
  transfersIn: (json["in"] ?? json["In"]) == null
      ? []
      : List<In>.from((json["in"] ?? json["In"]).map((x) => In.fromJson(x))),
  transferOut: (json["out"] ?? json["Out"]) == null
      ? []
      : List<In>.from((json["out"] ?? json["Out"]).map((x) => In.fromJson(x))),
);


  Map<String, dynamic> toJson() => {
    "in": transfersIn.isEmpty
        ? []
        : List<dynamic>.from(transfersIn.map((x) => x.toJson())),
    "out": transferOut.isEmpty
        ? []
        : List<dynamic>.from(transferOut.map((x) => x.toJson())),
  };
}

class In {
  final String? id;
  final String? name;
  final String? date;
  final String? age;
  final String? position;
  final String? from;
  final String? teamid;
  final String? type;
  final String? to;

  In({
    this.id,
    this.name,
    this.date,
    this.age,
    this.position,
    this.from,
    this.teamid,
    this.type,
    this.to,
  });

  factory In.fromJson(Map<String, dynamic> json) => In(
    id: json["id"],
    name: json["name"],
    date: json["date"],
    age: json["age"],
    position: json["position"],
    from: json["from"],
    teamid: json["teamid"],
    type: json["type"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "date": date,
    "age": age,
    "position": position,
    "from": from,
    "teamid": teamid,
    "type": type,
    "to": to,
  };
}

class Trophy {
  final String? country;
  final String? league;
  final String? status;
  final String? count;
  final String? seasons;

  Trophy({this.country, this.league, this.status, this.count, this.seasons});

  factory Trophy.fromJson(Map<String, dynamic> json) => Trophy(
    country: json["country"],
    league: json["league"],
    status: json["status"],
    count: json["count"],
    seasons: json["seasons"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "league": league,
    "status": status,
    "count": count,
    "seasons": seasons,
  };
}
