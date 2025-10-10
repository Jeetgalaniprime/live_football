// To parse this JSON data, do
//
//     final leagueScheduleModel = leagueScheduleModelFromJson(jsonString);

import 'dart:convert';

List<LeagueScheduleModel> leagueScheduleModelFromJson(String str) =>
    List<LeagueScheduleModel>.from(
      json.decode(str).map((x) => LeagueScheduleModel.fromJson(x)),
    );

String leagueScheduleModelToJson(List<LeagueScheduleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeagueScheduleModel {
  final String? id;
  final Time? time;
  final String? status;
  final String? gsVisitorteamid;
  final String? gsLocalteamid;
  final String? localteamid;
  final String? visitorteamid;
  final String? date;
  final String? scoretime;
  final int? isOt;
  final String? localteam;
  final String? visitorteam;
  final String? leagueid;
  final String? venueid;
  final String? leaguename;
  final Filegroup? filegroup;
  final StageRound? stageRound;
  final StageName? stageName;
  final String? stageId;
  final Season? season;
  final LeagueKey? leagueKey;
  final int? hasOdd;
  final String? referee;
  final String? coachVisitor;
  final String? coachVisitorId;
  final String? coachLocal;
  final String? coachLocalId;
  final String? injuryminute;
  final String? injurytime;
  final String? addedTimePeriod1;
  final String? addedTimePeriod2;
  final int? visitorteamrc;
  final int? localteamrc;
  final String? penaltyLocalTeam;
  final String? penaltyVisitorTeam;
  final List<Penalty>? penalties;
  final String? week;
  final int? isEt;
  final GsLeaguename? gsLeaguename;
  final Filegroup? gsFilegroup;

  LeagueScheduleModel({
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
    this.localteam,
    this.visitorteam,
    this.leagueid,
    this.venueid,
    this.leaguename,
    this.filegroup,
    this.stageRound,
    this.stageName,
    this.stageId,
    this.season,
    this.leagueKey,
    this.hasOdd,
    this.referee,
    this.coachVisitor,
    this.coachVisitorId,
    this.coachLocal,
    this.coachLocalId,
    this.injuryminute,
    this.injurytime,
    this.addedTimePeriod1,
    this.addedTimePeriod2,
    this.visitorteamrc,
    this.localteamrc,
    this.penaltyLocalTeam,
    this.penaltyVisitorTeam,
    this.penalties,
    this.week,
    this.isEt,
    this.gsLeaguename,
    this.gsFilegroup,
  });

  factory LeagueScheduleModel.fromJson(Map<String, dynamic> json) =>
      LeagueScheduleModel(
        id: json["id"],
        time: timeValues.map[json["time"]],
        status: json["status"],
        gsVisitorteamid: json["gs_visitorteamid"],
        gsLocalteamid: json["gs_localteamid"],
        localteamid: json["localteamid"],
        visitorteamid: json["visitorteamid"],
        date: json["date"].toString(),
        scoretime: json["scoretime"],
        isOt: json["isOT"],
        localteam: json["localteam"],
        visitorteam: json["visitorteam"],
        leagueid: json["leagueid"],
        venueid: json["venueid"],
        leaguename: json["leaguename"],
        filegroup: filegroupValues.map[json["filegroup"]],
        stageRound: stageRoundValues.map[json["stageRound"]],
        stageName: stageNameValues.map[json["stageName"]],
        stageId: json["stageId"],
        season: seasonValues.map[json["season"]],
        leagueKey: leagueKeyValues.map[json["leagueKey"]],
        hasOdd: json["hasOdd"],
        referee: json["referee"],
        coachVisitor: json["coachVisitor"],
        coachVisitorId: json["coachVisitorId"],
        coachLocal: json["coachLocal"],
        coachLocalId: json["coachLocalId"],
        injuryminute: json["injuryminute"],
        injurytime: json["injurytime"],
        addedTimePeriod1: json["addedTime_period1"],
        addedTimePeriod2: json["addedTime_period2"],
        visitorteamrc: json["visitorteamrc"],
        localteamrc: json["localteamrc"],
        penaltyLocalTeam: json["penaltyLocalTeam"],
        penaltyVisitorTeam: json["penaltyVisitorTeam"],
        penalties: json["penalties"] == null
            ? []
            : List<Penalty>.from(
                json["penalties"]!.map((x) => Penalty.fromJson(x)),
              ),
        week: json["week"],
        isEt: json["isET"],
        gsLeaguename: gsLeaguenameValues.map[json["gs_leaguename"]],
        gsFilegroup: filegroupValues.map[json["gs_filegroup"]],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "time": timeValues.reverse[time],
    "status": status,
    "gs_visitorteamid": gsVisitorteamid,
    "gs_localteamid": gsLocalteamid,
    "localteamid": localteamid,
    "visitorteamid": visitorteamid,
    "date": date.toString(),
    "scoretime": scoretime,
    "isOT": isOt,
    "localteam": localteam,
    "visitorteam": visitorteam,
    "leagueid": leagueid,
    "venueid": venueid,
    "leaguename": leaguename,
    "filegroup": filegroupValues.reverse[filegroup],
    "stageRound": stageRoundValues.reverse[stageRound],
    "stageName": stageNameValues.reverse[stageName],
    "stageId": stageId,
    "season": seasonValues.reverse[season],
    "leagueKey": leagueKeyValues.reverse[leagueKey],
    "hasOdd": hasOdd,
    "referee": referee,
    "coachVisitor": coachVisitor,
    "coachVisitorId": coachVisitorId,
    "coachLocal": coachLocal,
    "coachLocalId": coachLocalId,
    "injuryminute": injuryminute,
    "injurytime": injurytime,
    "addedTime_period1": addedTimePeriod1,
    "addedTime_period2": addedTimePeriod2,
    "visitorteamrc": visitorteamrc,
    "localteamrc": localteamrc,
    "penaltyLocalTeam": penaltyLocalTeam,
    "penaltyVisitorTeam": penaltyVisitorTeam,
    "penalties": penalties == null
        ? []
        : List<dynamic>.from(penalties!.map((x) => x.toJson())),
    "week": week,
    "isET": isEt,
    "gs_leaguename": gsLeaguenameValues.reverse[gsLeaguename],
    "gs_filegroup": filegroupValues.reverse[gsFilegroup],
  };
}

enum Date {
  THE_02102025,
  THE_05082025,
  THE_06112025,
  THE_07082025,
  THE_11122025,
  THE_13082025,
  THE_14082025,
  THE_18122025,
  THE_21082025,
  THE_23102025,
  THE_24072025,
  THE_27082025,
  THE_27112025,
  THE_28082025,
  THE_29072025,
  THE_31072025,
}

enum Filegroup { EUROCUPS }

final filegroupValues = EnumValues({"Eurocups": Filegroup.EUROCUPS});

enum GsLeaguename { EUROPA_CONFERENCE_LEAGUE }

final gsLeaguenameValues = EnumValues({
  "Europa Conference League": GsLeaguename.EUROPA_CONFERENCE_LEAGUE,
});

enum LeagueKey { EUROCUPS_UEFA_EUROPA_CONFERENCE_LEAGUE }

final leagueKeyValues = EnumValues({
  "EurocupsUEFAEuropaConferenceLeague":
      LeagueKey.EUROCUPS_UEFA_EUROPA_CONFERENCE_LEAGUE,
});

enum Leaguename { UEFA_EUROPA_CONFERENCE_LEAGUE }

final leaguenameValues = EnumValues({
  "UEFA Europa Conference League": Leaguename.UEFA_EUROPA_CONFERENCE_LEAGUE,
});

class Penalty {
  final String? id;
  final bool? ignoreNotification;
  final Type? type;
  final int? scored;
  final Team? team;
  final String? minute;
  final String? extraMin;
  final String? player;
  final String? result;
  final String? score;
  final String? playerId;

  Penalty({
    this.id,
    this.ignoreNotification,
    this.type,
    this.scored,
    this.team,
    this.minute,
    this.extraMin,
    this.player,
    this.result,
    this.score,
    this.playerId,
  });

  factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
    id: json["id"],
    ignoreNotification: json["ignoreNotification"],
    type: typeValues.map[json["type"]]!,
    scored: json["scored"],
    team: teamValues.map[json["team"]]!,
    minute: json["minute"],
    extraMin: json["extra_min"],
    player: json["player"],
    result: json["result"],
    score: json["score"],
    playerId: json["playerId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ignoreNotification": ignoreNotification,
    "type": typeValues.reverse[type],
    "scored": scored,
    "team": teamValues.reverse[team],
    "minute": minute,
    "extra_min": extraMin,
    "player": player,
    "result": result,
    "score": score,
    "playerId": playerId,
  };
}

enum Team { LOCALTEAM, VISITORTEAM }

final teamValues = EnumValues({
  "localteam": Team.LOCALTEAM,
  "visitorteam": Team.VISITORTEAM,
});

enum Type { GOAL, PEN_MISS, YELLOWCARD }

final typeValues = EnumValues({
  "goal": Type.GOAL,
  "pen miss": Type.PEN_MISS,
  "yellowcard": Type.YELLOWCARD,
});

enum Season { THE_20252026 }

final seasonValues = EnumValues({"2025/2026": Season.THE_20252026});

enum StageName {
  LEAGUE_PHASE,
  PLAY_OFFS,
  THE_2_ND_QUALIFYING_ROUND,
  THE_3_RD_QUALIFYING_ROUND,
}

final stageNameValues = EnumValues({
  "League Phase": StageName.LEAGUE_PHASE,
  "Play-offs": StageName.PLAY_OFFS,
  "2nd Qualifying Round": StageName.THE_2_ND_QUALIFYING_ROUND,
  "3rd Qualifying Round": StageName.THE_3_RD_QUALIFYING_ROUND,
});

enum StageRound { GROUP_STAGE, QUALIFYING }

final stageRoundValues = EnumValues({
  "Group Stage": StageRound.GROUP_STAGE,
  "Qualifying": StageRound.QUALIFYING,
});

enum Time {
  THE_1400,
  THE_1530,
  THE_1600,
  THE_1630,
  THE_1645,
  THE_1700,
  THE_1730,
  THE_1745,
  THE_1800,
  THE_1815,
  THE_1830,
  THE_1845,
  THE_1900,
  THE_2000,
}

final timeValues = EnumValues({
  "14:00": Time.THE_1400,
  "15:30": Time.THE_1530,
  "16:00": Time.THE_1600,
  "16:30": Time.THE_1630,
  "16:45": Time.THE_1645,
  "17:00": Time.THE_1700,
  "17:30": Time.THE_1730,
  "17:45": Time.THE_1745,
  "18:00": Time.THE_1800,
  "18:15": Time.THE_1815,
  "18:30": Time.THE_1830,
  "18:45": Time.THE_1845,
  "19:00": Time.THE_1900,
  "20:00": Time.THE_2000,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
