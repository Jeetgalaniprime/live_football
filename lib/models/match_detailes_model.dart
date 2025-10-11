// To parse this JSON data, do
//
//     final matchDetailsModel = matchDetailsModelFromJson(jsonString);

import 'dart:convert';

MatchDetailsModel matchDetailsModelFromJson(String str) =>
    MatchDetailsModel.fromJson(json.decode(str));

String matchDetailsModelToJson(MatchDetailsModel data) =>
    json.encode(data.toJson());

class MatchDetailsModel {
  final String? id;
  final String? time;
  final Lineups? lineups;
  final String? status;
  final List<Event>? events;
  final String? gsVisitorteamid;
  final String? gsLocalteamid;
  final String? localteamid;
  final String? visitorteamid;
  final dynamic day;
  final String? ht;
  final String? date;
  final String? scoretime;
  final int? isEt;
  final int? isOt;
  final String? localteam;
  final String? visitorteam;
  final String? venue;
  final String? leagueid;
  final String? venueid;
  final String? leaguename;
  final String? filegroup;
  final String? gsLeaguename;
  final String? gsFilegroup;
  final String? stageRound;
  final String? stageName;
  final String? stageId;
  final String? season;
  final String? leagueKey;
  final String? lastUpdated;
  final int? hasLiveTicker;
  final String? hasH2H;
  final int? hi;
  final List<String>? mutualMatches;
  final String? localteamshape;
  final String? visitorteamshape;
  final List<ShapeFixture>? localteamshapefixtures;
  final List<ShapeFixture>? visitorteamshapefixtures;
  final int? hasOdd;
  final String? coachVisitor;
  final String? coachVisitorId;
  final Commentaries? commentaries;
  final String? coachLocal;
  final String? coachLocalId;
  final String? referee;
  final String? injuryminute;
  final String? injurytime;
  final int? visitorteamrc;
  final Stats? stats;
  final Odds? odds;
  final Bookmaker? oddPromo;
  final String? localteamOrg;
  final String? visitorteamOrg;
  final int? inlineAd;
  final double? inlineAdHeightRatio;
  final double? inlineAdWidthRatio;
  final int? inlineAdPosition;
  final int? inlineAdFrequencyChance;

  MatchDetailsModel({
    this.id,
    this.time,
    this.lineups,
    this.status,
    this.events,
    this.gsVisitorteamid,
    this.gsLocalteamid,
    this.localteamid,
    this.visitorteamid,
    this.day,
    this.ht,
    this.date,
    this.scoretime,
    this.isEt,
    this.isOt,
    this.localteam,
    this.visitorteam,
    this.venue,
    this.leagueid,
    this.venueid,
    this.leaguename,
    this.filegroup,
    this.gsLeaguename,
    this.gsFilegroup,
    this.stageRound,
    this.stageName,
    this.stageId,
    this.season,
    this.leagueKey,
    this.lastUpdated,
    this.hasLiveTicker,
    this.hasH2H,
    this.hi,
    this.mutualMatches,
    this.localteamshape,
    this.visitorteamshape,
    this.localteamshapefixtures,
    this.visitorteamshapefixtures,
    this.hasOdd,
    this.coachVisitor,
    this.coachVisitorId,
    this.commentaries,
    this.coachLocal,
    this.coachLocalId,
    this.referee,
    this.injuryminute,
    this.injurytime,
    this.visitorteamrc,
    this.stats,
    this.odds,
    this.oddPromo,
    this.localteamOrg,
    this.visitorteamOrg,
    this.inlineAd,
    this.inlineAdHeightRatio,
    this.inlineAdWidthRatio,
    this.inlineAdPosition,
    this.inlineAdFrequencyChance,
  });

  factory MatchDetailsModel.fromJson(Map<String, dynamic> json) =>
      MatchDetailsModel(
        id: json["id"],
        time: json["time"],
        lineups: json["lineups"] == null
            ? null
            : Lineups.fromJson(json["lineups"]),
        status: json["status"],
        events: json["events"] == null
            ? []
            : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
        gsVisitorteamid: json["gs_visitorteamid"],
        gsLocalteamid: json["gs_localteamid"],
        localteamid: json["localteamid"],
        visitorteamid: json["visitorteamid"],
        day: json["day"],
        ht: json["ht"],
        date: json["date"],
        scoretime: json["scoretime"],
        isEt: json["isET"],
        isOt: json["isOT"],
        localteam: json["localteam"],
        visitorteam: json["visitorteam"],
        venue: json["venue"],
        leagueid: json["leagueid"],
        venueid: json["venueid"],
        leaguename: json["leaguename"],
        filegroup: json["filegroup"],
        gsLeaguename: json["gs_leaguename"],
        gsFilegroup: json["gs_filegroup"],
        stageRound: json["stageRound"],
        stageName: json["stageName"],
        stageId: json["stageId"],
        season: json["season"],
        leagueKey: json["leagueKey"],
        lastUpdated: json["lastUpdated"],
        hasLiveTicker: json["hasLiveTicker"],
        hasH2H: json["hasH2H"],
        hi: json["hi"],
        mutualMatches: json["mutualMatches"] == null
            ? []
            : List<String>.from(json["mutualMatches"]!.map((x) => x)),
        localteamshape: json["localteamshape"],
        visitorteamshape: json["visitorteamshape"],
        localteamshapefixtures: json["localteamshapefixtures"] == null
            ? []
            : List<ShapeFixture>.from(
                json["localteamshapefixtures"]!.map(
                  (x) => ShapeFixture.fromJson(x),
                ),
              ),
        visitorteamshapefixtures: json["visitorteamshapefixtures"] == null
            ? []
            : List<ShapeFixture>.from(
                json["visitorteamshapefixtures"]!.map(
                  (x) => ShapeFixture.fromJson(x),
                ),
              ),
        hasOdd: json["hasOdd"],
        coachVisitor: json["coachVisitor"],
        coachVisitorId: json["coachVisitorId"],
        commentaries: json["commentaries"] == null
            ? null
            : Commentaries.fromJson(json["commentaries"]),
        coachLocal: json["coachLocal"],
        coachLocalId: json["coachLocalId"],
        referee: json["referee"],
        injuryminute: json["injuryminute"],
        injurytime: json["injurytime"],
        visitorteamrc: json["visitorteamrc"],
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        odds: json["odds"] == null ? null : Odds.fromJson(json["odds"]),
        oddPromo: json["oddPromo"] == null
            ? null
            : Bookmaker.fromJson(json["oddPromo"]),
        localteamOrg: json["localteam_org"],
        visitorteamOrg: json["visitorteam_org"],
        inlineAd: json["inline_ad"],
        inlineAdHeightRatio: json["inline_ad_height_ratio"]?.toDouble(),
        inlineAdWidthRatio: json["inline_ad_width_ratio"]?.toDouble(),
        inlineAdPosition: json["inline_ad_position"],
        inlineAdFrequencyChance: json["inline_ad_frequency_chance"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "time": time,
    "lineups": lineups?.toJson(),
    "status": status,
    "events": events == null
        ? []
        : List<dynamic>.from(events!.map((x) => x.toJson())),
    "gs_visitorteamid": gsVisitorteamid,
    "gs_localteamid": gsLocalteamid,
    "localteamid": localteamid,
    "visitorteamid": visitorteamid,
    "day": day,
    "ht": ht,
    "date": date,
    "scoretime": scoretime,
    "isET": isEt,
    "isOT": isOt,
    "localteam": localteam,
    "visitorteam": visitorteam,
    "venue": venue,
    "leagueid": leagueid,
    "venueid": venueid,
    "leaguename": leaguename,
    "filegroup": filegroup,
    "gs_leaguename": gsLeaguename,
    "gs_filegroup": gsFilegroup,
    "stageRound": stageRound,
    "stageName": stageName,
    "stageId": stageId,
    "season": season,
    "leagueKey": leagueKey,
    "lastUpdated": lastUpdated,
    "hasLiveTicker": hasLiveTicker,
    "hasH2H": hasH2H,
    "hi": hi,
    "mutualMatches": mutualMatches == null
        ? []
        : List<dynamic>.from(mutualMatches!.map((x) => x)),
    "localteamshape": localteamshape,
    "visitorteamshape": visitorteamshape,
    "localteamshapefixtures": localteamshapefixtures == null
        ? []
        : List<dynamic>.from(localteamshapefixtures!.map((x) => x.toJson())),
    "visitorteamshapefixtures": visitorteamshapefixtures == null
        ? []
        : List<dynamic>.from(visitorteamshapefixtures!.map((x) => x.toJson())),
    "hasOdd": hasOdd,
    "coachVisitor": coachVisitor,
    "coachVisitorId": coachVisitorId,
    "commentaries": commentaries?.toJson(),
    "coachLocal": coachLocal,
    "coachLocalId": coachLocalId,
    "referee": referee,
    "injuryminute": injuryminute,
    "injurytime": injurytime,
    "visitorteamrc": visitorteamrc,
    "stats": stats?.toJson(),
    "odds": odds?.toJson(),
    "oddPromo": oddPromo?.toJson(),
    "localteam_org": localteamOrg,
    "visitorteam_org": visitorteamOrg,
    "inline_ad": inlineAd,
    "inline_ad_height_ratio": inlineAdHeightRatio,
    "inline_ad_width_ratio": inlineAdWidthRatio,
    "inline_ad_position": inlineAdPosition,
    "inline_ad_frequency_chance": inlineAdFrequencyChance,
  };
}

class Commentaries {
  final Substitutions? substitutions;
  final Playerstats? playerstats;
  final Substitutes? substitutes;
  final String? localteamcolor;
  final String? localteamnumbercolor;
  final String? localteambordercolor;
  final String? visitorteamcolor;
  final String? visitorteamnumbercolor;
  final String? visitorteambordercolor;
  final String? localgoalkeepercolor;
  final String? localgoalkeepernumbercolor;
  final String? localgoalkeeperbordercolor;
  final String? visitorgoalkeepercolor;
  final String? visitorgoalkeepernumbercolor;
  final String? visitorgoalkeeperbordercolor;
  final List<CommentaryEvent>? events;
  final Teams? teams;
  final List<dynamic>? commentaries;

  Commentaries({
    this.substitutions,
    this.playerstats,
    this.substitutes,
    this.localteamcolor,
    this.localteamnumbercolor,
    this.localteambordercolor,
    this.visitorteamcolor,
    this.visitorteamnumbercolor,
    this.visitorteambordercolor,
    this.localgoalkeepercolor,
    this.localgoalkeepernumbercolor,
    this.localgoalkeeperbordercolor,
    this.visitorgoalkeepercolor,
    this.visitorgoalkeepernumbercolor,
    this.visitorgoalkeeperbordercolor,
    this.events,
    this.teams,
    this.commentaries,
  });

  factory Commentaries.fromJson(Map<String, dynamic> json) => Commentaries(
    substitutions: json["substitutions"] == null
        ? null
        : Substitutions.fromJson(json["substitutions"]),
    playerstats: json["playerstats"] == null
        ? null
        : Playerstats.fromJson(json["playerstats"]),
    substitutes: json["substitutes"] == null
        ? null
        : Substitutes.fromJson(json["substitutes"]),
    localteamcolor: json["localteamcolor"],
    localteamnumbercolor: json["localteamnumbercolor"],
    localteambordercolor: json["localteambordercolor"],
    visitorteamcolor: json["visitorteamcolor"],
    visitorteamnumbercolor: json["visitorteamnumbercolor"],
    visitorteambordercolor: json["visitorteambordercolor"],
    localgoalkeepercolor: json["localgoalkeepercolor"],
    localgoalkeepernumbercolor: json["localgoalkeepernumbercolor"],
    localgoalkeeperbordercolor: json["localgoalkeeperbordercolor"],
    visitorgoalkeepercolor: json["visitorgoalkeepercolor"],
    visitorgoalkeepernumbercolor: json["visitorgoalkeepernumbercolor"],
    visitorgoalkeeperbordercolor: json["visitorgoalkeeperbordercolor"],
    events: json["events"] == null
        ? []
        : List<CommentaryEvent>.from(
            json["events"]!.map((x) => CommentaryEvent.fromJson(x)),
          ),
    teams: json["teams"] == null ? null : Teams.fromJson(json["teams"]),
    commentaries: json["commentaries"] == null
        ? []
        : List<dynamic>.from(json["commentaries"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "substitutions": substitutions?.toJson(),
    "playerstats": playerstats?.toJson(),
    "substitutes": substitutes?.toJson(),
    "localteamcolor": localteamcolor,
    "localteamnumbercolor": localteamnumbercolor,
    "localteambordercolor": localteambordercolor,
    "visitorteamcolor": visitorteamcolor,
    "visitorteamnumbercolor": visitorteamnumbercolor,
    "visitorteambordercolor": visitorteambordercolor,
    "localgoalkeepercolor": localgoalkeepercolor,
    "localgoalkeepernumbercolor": localgoalkeepernumbercolor,
    "localgoalkeeperbordercolor": localgoalkeeperbordercolor,
    "visitorgoalkeepercolor": visitorgoalkeepercolor,
    "visitorgoalkeepernumbercolor": visitorgoalkeepernumbercolor,
    "visitorgoalkeeperbordercolor": visitorgoalkeeperbordercolor,
    "events": events == null
        ? []
        : List<dynamic>.from(events!.map((x) => x.toJson())),
    "teams": teams?.toJson(),
    "commentaries": commentaries == null
        ? []
        : List<dynamic>.from(commentaries!.map((x) => x)),
  };
}

class CommentaryEvent {
  final String? type;
  final String? team;
  final String? minute;
  final String? player;
  final String? result;
  final String? playerId;
  final String? assist;
  final String? assistid;
  final String? extraMin;

  CommentaryEvent({
    this.type,
    this.team,
    this.minute,
    this.player,
    this.result,
    this.playerId,
    this.assist,
    this.assistid,
    this.extraMin,
  });

  factory CommentaryEvent.fromJson(Map<String, dynamic> json) =>
      CommentaryEvent(
        type: json["type"],
        team: json["team"],
        minute: json["minute"],
        player: json["player"],
        result: json["result"],
        playerId: json["playerId"],
        assist: json["assist"],
        assistid: json["assistid"],
        extraMin: json["extra_min"],
      );

  Map<String, dynamic> toJson() => {
    "type": type,
    "team": team,
    "minute": minute,
    "player": player,
    "result": result,
    "playerId": playerId,
    "assist": assist,
    "assistid": assistid,
    "extra_min": extraMin,
  };
}

class Playerstats {
  final List<dynamic>? localteam;
  final List<dynamic>? visitorteam;

  Playerstats({this.localteam, this.visitorteam});

  factory Playerstats.fromJson(Map<String, dynamic> json) => Playerstats(
    localteam: json["localteam"] == null
        ? []
        : List<dynamic>.from(json["localteam"]!.map((x) => x)),
    visitorteam: json["visitorteam"] == null
        ? []
        : List<dynamic>.from(json["visitorteam"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "localteam": localteam == null
        ? []
        : List<dynamic>.from(localteam!.map((x) => x)),
    "visitorteam": visitorteam == null
        ? []
        : List<dynamic>.from(visitorteam!.map((x) => x)),
  };
}

class Substitutes {
  final List<SubstitutePlayer>? localteam;
  final List<SubstitutePlayer>? visitorteam;
  final String? source;

  Substitutes({this.localteam, this.visitorteam, this.source});

  factory Substitutes.fromJson(Map<String, dynamic> json) => Substitutes(
    localteam: json["localteam"] == null
        ? []
        : List<SubstitutePlayer>.from(
            json["localteam"]!.map((x) => SubstitutePlayer.fromJson(x)),
          ),
    visitorteam: json["visitorteam"] == null
        ? []
        : List<SubstitutePlayer>.from(
            json["visitorteam"]!.map((x) => SubstitutePlayer.fromJson(x)),
          ),
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "localteam": localteam == null
        ? []
        : List<dynamic>.from(localteam!.map((x) => x.toJson())),
    "visitorteam": visitorteam == null
        ? []
        : List<dynamic>.from(visitorteam!.map((x) => x.toJson())),
    "source": source,
  };
}

class SubstitutePlayer {
  final String? name;
  final String? pos;
  final String? number;
  final String? id;

  SubstitutePlayer({this.name, this.pos, this.number, this.id});

  factory SubstitutePlayer.fromJson(Map<String, dynamic> json) =>
      SubstitutePlayer(
        name: json["name"],
        pos: json["pos"],
        number: json["number"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "pos": pos,
    "number": number,
    "id": id,
  };
}

class Substitutions {
  final List<TeamSubstitution>? localteam;
  final List<TeamSubstitution>? visitorteam;
  final String? source;

  Substitutions({this.localteam, this.visitorteam, this.source});

  factory Substitutions.fromJson(Map<String, dynamic> json) => Substitutions(
    localteam: json["localteam"] == null
        ? []
        : List<TeamSubstitution>.from(
            json["localteam"]!.map((x) => TeamSubstitution.fromJson(x)),
          ),
    visitorteam: json["visitorteam"] == null
        ? []
        : List<TeamSubstitution>.from(
            json["visitorteam"]!.map((x) => TeamSubstitution.fromJson(x)),
          ),
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "localteam": localteam == null
        ? []
        : List<dynamic>.from(localteam!.map((x) => x.toJson())),
    "visitorteam": visitorteam == null
        ? []
        : List<dynamic>.from(visitorteam!.map((x) => x.toJson())),
    "source": source,
  };
}

class TeamSubstitution {
  final String? off;
  final String? on;
  final String? onId;
  final String? offId;
  final String? minute;
  final String? injury;

  TeamSubstitution({
    this.off,
    this.on,
    this.onId,
    this.offId,
    this.minute,
    this.injury,
  });

  factory TeamSubstitution.fromJson(Map<String, dynamic> json) =>
      TeamSubstitution(
        off: json["off"],
        on: json["on"],
        onId: json["on_id"],
        offId: json["off_id"],
        minute: json["minute"],
        injury: json["injury"],
      );

  Map<String, dynamic> toJson() => {
    "off": off,
    "on": on,
    "on_id": onId,
    "off_id": offId,
    "minute": minute,
    "injury": injury,
  };
}

class Teams {
  final List<TeamPlayer>? localteam;
  final List<TeamPlayer>? visitorteam;
  final String? localFormationType2;
  final String? visitorFormationType2;
  final String? localFormationTypeV3;
  final String? visitorFormationTypeV3;
  final String? source;

  Teams({
    this.localteam,
    this.visitorteam,
    this.localFormationType2,
    this.visitorFormationType2,
    this.localFormationTypeV3,
    this.visitorFormationTypeV3,
    this.source,
  });

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
    localteam: json["localteam"] == null
        ? []
        : List<TeamPlayer>.from(
            json["localteam"]!.map((x) => TeamPlayer.fromJson(x)),
          ),
    visitorteam: json["visitorteam"] == null
        ? []
        : List<TeamPlayer>.from(
            json["visitorteam"]!.map((x) => TeamPlayer.fromJson(x)),
          ),
    localFormationType2: json["localFormationType2"],
    visitorFormationType2: json["visitorFormationType2"],
    localFormationTypeV3: json["localFormationTypeV3"],
    visitorFormationTypeV3: json["visitorFormationTypeV3"],
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "localteam": localteam == null
        ? []
        : List<dynamic>.from(localteam!.map((x) => x.toJson())),
    "visitorteam": visitorteam == null
        ? []
        : List<dynamic>.from(visitorteam!.map((x) => x.toJson())),
    "localFormationType2": localFormationType2,
    "visitorFormationType2": visitorFormationType2,
    "localFormationTypeV3": localFormationTypeV3,
    "visitorFormationTypeV3": visitorFormationTypeV3,
    "source": source,
  };
}

class TeamPlayer {
  final String? name;
  final String? pos;
  final String? posn;
  final String? number;
  final String? id;
  final String? posV3;
  final double? x;
  final double? y;

  TeamPlayer({
    this.name,
    this.pos,
    this.posn,
    this.number,
    this.id,
    this.posV3,
    this.x,
    this.y,
  });

  factory TeamPlayer.fromJson(Map<String, dynamic> json) => TeamPlayer(
    name: json["name"],
    pos: json["pos"],
    posn: json["posn"],
    number: json["number"],
    id: json["id"],
    posV3: json["posV3"],
    x: json["x"]?.toDouble(),
    y: json["y"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "pos": pos,
    "posn": posn,
    "number": number,
    "id": id,
    "posV3": posV3,
    "x": x,
    "y": y,
  };
}

class Event {
  final String? id;
  final String? type;
  final String? team;
  final String? minute;
  final String? extraMin;
  final String? player;
  final String? result;
  final String? playerId;
  final String? assist;
  final String? assistId;

  Event({
    this.id,
    this.type,
    this.team,
    this.minute,
    this.extraMin,
    this.player,
    this.result,
    this.playerId,
    this.assist,
    this.assistId,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    type: json["type"],
    team: json["team"],
    minute: json["minute"],
    extraMin: json["extra_min"],
    player: json["player"],
    result: json["result"],
    playerId: json["playerId"],
    assist: json["assist"],
    assistId: json["assistId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "team": team,
    "minute": minute,
    "extra_min": extraMin,
    "player": player,
    "result": result,
    "playerId": playerId,
    "assist": assist,
    "assistId": assistId,
  };
}

class Lineups {
  final List<LineupPlayer>? localteam;
  final List<LineupPlayer>? visitorteam;

  Lineups({this.localteam, this.visitorteam});

  factory Lineups.fromJson(Map<String, dynamic> json) => Lineups(
    localteam: json["localteam"] == null
        ? []
        : List<LineupPlayer>.from(
            json["localteam"]!.map((x) => LineupPlayer.fromJson(x)),
          ),
    visitorteam: json["visitorteam"] == null
        ? []
        : List<LineupPlayer>.from(
            json["visitorteam"]!.map((x) => LineupPlayer.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "localteam": localteam == null
        ? []
        : List<dynamic>.from(localteam!.map((x) => x.toJson())),
    "visitorteam": visitorteam == null
        ? []
        : List<dynamic>.from(visitorteam!.map((x) => x.toJson())),
  };
}

class LineupPlayer {
  final String? name;
  final String? id;
  final String? booking;
  final String? number;

  LineupPlayer({this.name, this.id, this.booking, this.number});

  factory LineupPlayer.fromJson(Map<String, dynamic> json) => LineupPlayer(
    name: json["name"],
    id: json["id"],
    booking: json["booking"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "booking": booking,
    "number": number,
  };
}

class ShapeFixture {
  final String? id;
  final String? time;
  final String? status;
  final String? gsVisitorteamid;
  final String? gsLocalteamid;
  final String? localteamid;
  final String? visitorteamid;
  final String? date;
  final String? scoretime;
  final int? isEt;
  final int? isOt;
  final String? localteam;
  final String? visitorteam;
  final String? leagueid;
  final String? leaguename;
  final String? filegroup;
  final String? gsLeaguename;
  final String? gsFilegroup;
  final String? stageId;
  final String? leagueKey;
  final int? hi;
  final String? coachLocal;
  final String? coachVisitor;
  final String? coachLocalId;
  final String? coachVisitorId;
  final String? injuryminute;
  final String? localteamOrg;
  final String? visitorteamOrg;
  final int? hasOdd;
  final int? localteamrc;
  final String? injurytime;
  final String? referee;
  final String? refereeId;
  final int? visitorteamrc;
  final String? penaltyLocalTeam;
  final String? penaltyVisitorTeam;
  final List<Penalty>? penalties;

  ShapeFixture({
    this.id,
    this.time,
    this.status,
    this.gsVisitorteamid,
    this.gsLocalteamid,
    this.localteamid,
    this.visitorteamid,
    this.date,
    this.scoretime,
    this.isEt,
    this.isOt,
    this.localteam,
    this.visitorteam,
    this.leagueid,
    this.leaguename,
    this.filegroup,
    this.gsLeaguename,
    this.gsFilegroup,
    this.stageId,
    this.leagueKey,
    this.hi,
    this.coachLocal,
    this.coachVisitor,
    this.coachLocalId,
    this.coachVisitorId,
    this.injuryminute,
    this.localteamOrg,
    this.visitorteamOrg,
    this.hasOdd,
    this.localteamrc,
    this.injurytime,
    this.referee,
    this.refereeId,
    this.visitorteamrc,
    this.penaltyLocalTeam,
    this.penaltyVisitorTeam,
    this.penalties,
  });

  factory ShapeFixture.fromJson(Map<String, dynamic> json) => ShapeFixture(
    id: json["id"],
    time: json["time"],
    status: json["status"],
    gsVisitorteamid: json["gs_visitorteamid"],
    gsLocalteamid: json["gs_localteamid"],
    localteamid: json["localteamid"],
    visitorteamid: json["visitorteamid"],
    date: json["date"],
    scoretime: json["scoretime"],
    isEt: json["isET"],
    isOt: json["isOT"],
    localteam: json["localteam"],
    visitorteam: json["visitorteam"],
    leagueid: json["leagueid"],
    leaguename: json["leaguename"],
    filegroup: json["filegroup"],
    gsLeaguename: json["gs_leaguename"],
    gsFilegroup: json["gs_filegroup"],
    stageId: json["stageId"],
    leagueKey: json["leagueKey"],
    hi: json["hi"],
    coachLocal: json["coachLocal"],
    coachVisitor: json["coachVisitor"],
    coachLocalId: json["coachLocalId"],
    coachVisitorId: json["coachVisitorId"],
    injuryminute: json["injuryminute"],
    localteamOrg: json["localteam_org"],
    visitorteamOrg: json["visitorteam_org"],
    hasOdd: json["hasOdd"],
    localteamrc: json["localteamrc"],
    injurytime: json["injurytime"],
    referee: json["referee"],
    refereeId: json["refereeId"],
    visitorteamrc: json["visitorteamrc"],
    penaltyLocalTeam: json["penaltyLocalTeam"],
    penaltyVisitorTeam: json["penaltyVisitorTeam"],
    penalties: json["penalties"] == null
        ? []
        : List<Penalty>.from(
            json["penalties"]!.map((x) => Penalty.fromJson(x)),
          ),
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
    "isET": isEt,
    "isOT": isOt,
    "localteam": localteam,
    "visitorteam": visitorteam,
    "leagueid": leagueid,
    "leaguename": leaguename,
    "filegroup": filegroup,
    "gs_leaguename": gsLeaguename,
    "gs_filegroup": gsFilegroup,
    "stageId": stageId,
    "leagueKey": leagueKey,
    "hi": hi,
    "coachLocal": coachLocal,
    "coachVisitor": coachVisitor,
    "coachLocalId": coachLocalId,
    "coachVisitorId": coachVisitorId,
    "injuryminute": injuryminute,
    "localteam_org": localteamOrg,
    "visitorteam_org": visitorteamOrg,
    "hasOdd": hasOdd,
    "localteamrc": localteamrc,
    "injurytime": injurytime,
    "referee": referee,
    "refereeId": refereeId,
    "visitorteamrc": visitorteamrc,
    "penaltyLocalTeam": penaltyLocalTeam,
    "penaltyVisitorTeam": penaltyVisitorTeam,
    "penalties": penalties == null
        ? []
        : List<dynamic>.from(penalties!.map((x) => x.toJson())),
  };
}

class Penalty {
  final String? id;
  final bool? ignoreNotification;
  final String? type;
  final int? scored;
  final String? team;
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
    type: json["type"],
    scored: json["scored"],
    team: json["team"],
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
    "type": type,
    "scored": scored,
    "team": team,
    "minute": minute,
    "extra_min": extraMin,
    "player": player,
    "result": result,
    "score": score,
    "playerId": playerId,
  };
}

class Odds {
  final String? name;
  final String? id;
  final List<Bookmaker>? bookmakers;

  Odds({this.name, this.id, this.bookmakers});

  factory Odds.fromJson(Map<String, dynamic> json) => Odds(
    name: json["name"],
    id: json["id"],
    bookmakers: json["bookmakers"] == null
        ? []
        : List<Bookmaker>.from(
            json["bookmakers"]!.map((x) => Bookmaker.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "bookmakers": bookmakers == null
        ? []
        : List<dynamic>.from(bookmakers!.map((x) => x.toJson())),
  };
}

class Bookmaker {
  final String? name;
  final String? id;
  final String? extra;
  final String? homeValue;
  final String? awayValue;
  final String? drawValue;
  final String? homeName;
  final String? awayName;
  final String? drawName;
  final int? homeId;
  final int? awayId;
  final int? drawId;
  final String? type;

  Bookmaker({
    this.name,
    this.id,
    this.extra,
    this.homeValue,
    this.awayValue,
    this.drawValue,
    this.homeName,
    this.awayName,
    this.drawName,
    this.homeId,
    this.awayId,
    this.drawId,
    this.type,
  });

  factory Bookmaker.fromJson(Map<String, dynamic> json) => Bookmaker(
    name: json["name"],
    id: json["id"],
    extra: json["extra"],
    homeValue: json["homeValue"],
    awayValue: json["awayValue"],
    drawValue: json["drawValue"],
    homeName: json["homeName"],
    awayName: json["awayName"],
    drawName: json["drawName"],
    homeId: json["homeId"],
    awayId: json["awayId"],
    drawId: json["drawId"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "extra": extra,
    "homeValue": homeValue,
    "awayValue": awayValue,
    "drawValue": drawValue,
    "homeName": homeName,
    "awayName": awayName,
    "drawName": drawName,
    "homeId": homeId,
    "awayId": awayId,
    "drawId": drawId,
    "type": type,
  };
}

class Stats {
  final int? totalLocalteamWon;
  final int? totalVisitorteamWon;
  final int? totalDraws;
  final int? totalLocalteamScored;
  final int? totalVisitorteamScored;

  Stats({
    this.totalLocalteamWon,
    this.totalVisitorteamWon,
    this.totalDraws,
    this.totalLocalteamScored,
    this.totalVisitorteamScored,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    totalLocalteamWon: json["total_localteam_won"],
    totalVisitorteamWon: json["total_visitorteam_won"],
    totalDraws: json["total_draws"],
    totalLocalteamScored: json["total_localteam_scored"],
    totalVisitorteamScored: json["total_visitorteam_scored"],
  );

  Map<String, dynamic> toJson() => {
    "total_localteam_won": totalLocalteamWon,
    "total_visitorteam_won": totalVisitorteamWon,
    "total_draws": totalDraws,
    "total_localteam_scored": totalLocalteamScored,
    "total_visitorteam_scored": totalVisitorteamScored,
  };
}
