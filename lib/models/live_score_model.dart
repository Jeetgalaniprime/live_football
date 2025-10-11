class LiveScoreModel {
  List<Leagues>? leagues;
  String? country;

  LiveScoreModel({this.leagues, this.country});

  LiveScoreModel.fromJson(Map<String, dynamic> json) {
    if (json['leagues'] != null) {
      leagues = <Leagues>[];
      json['leagues'].forEach((v) {
        leagues!.add(new Leagues.fromJson(v));
      });
    }
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leagues != null) {
      data['leagues'] = this.leagues!.map((v) => v.toJson()).toList();
    }
    data['country'] = this.country;
    return data;
  }
}

class Leagues {
  String? league;
  String? key;
  String? hi;
  List<Matches>? matches;
  String? country;

  Leagues({this.league, this.key, this.hi, this.matches, this.country});

  Leagues.fromJson(Map<String, dynamic> json) {
    league = json['league'];
    key = json['key'];
    hi = json['hi'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(new Matches.fromJson(v));
      });
    }
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['league'] = this.league;
    data['key'] = this.key;
    data['hi'] = this.hi;
    if (this.matches != null) {
      data['matches'] = this.matches!.map((v) => v.toJson()).toList();
    }
    data['country'] = this.country;
    return data;
  }
}

class Matches {
  String? id;
  String? time;
  String? status;
  String? gsVisitorteamid;
  String? gsLocalteamid;
  String? localteamid;
  String? visitorteamid;
  String? ht;
  String? date;
  String? scoretime;
  String? localteam;
  String? visitorteam;
  String? leagueid;
  String? leaguename;
  String? filegroup;
  String? stageRound;
  String? stageName;
  String? stageId;
  String? week;
  String? leagueKey;
  int? hi;
  String? localteamOrg;
  String? visitorteamOrg;
  String? iw;

  String? wasFinished;
  String? addedTimePeriod1;
  String? addedTimePeriod2;
  String? injuryminute;
  String? injurytime;
  bool? notFromLiveFeed;

  Matches({
    this.id,
    this.time,
    this.status,
    this.gsVisitorteamid,
    this.gsLocalteamid,
    this.localteamid,
    this.visitorteamid,
    this.ht,
    this.date,
    this.scoretime,
    this.localteam,
    this.visitorteam,
    this.leagueid,
    this.leaguename,
    this.filegroup,
    this.stageRound,
    this.stageName,
    this.stageId,
    this.week,
    this.leagueKey,
    this.hi,
    this.localteamOrg,
    this.visitorteamOrg,
    this.iw,

    this.wasFinished,
    this.addedTimePeriod1,
    this.addedTimePeriod2,
    this.injuryminute,
    this.injurytime,
    this.notFromLiveFeed,
  });

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    status = json['status'];
    gsVisitorteamid = json['gs_visitorteamid'];
    gsLocalteamid = json['gs_localteamid'];
    localteamid = json['localteamid'];
    visitorteamid = json['visitorteamid'];
    ht = json['ht'];
    date = json['date'];
    scoretime = json['scoretime'];
    localteam = json['localteam'];
    visitorteam = json['visitorteam'];
    leagueid = json['leagueid'];
    leaguename = json['leaguename'];
    filegroup = json['filegroup'];
    stageRound = json['stageRound'];
    stageName = json['stageName'] ?? '';
    stageId = json['stageId'].toString();
    week = json['week'] ?? '';
    leagueKey = json['leagueKey'] ?? '';
    hi = json['hi'];
    localteamOrg = json['localteam_org'] ?? '';
    visitorteamOrg = json['visitorteam_org'] ?? '';
    iw = json['iw'].toString();

    wasFinished = json['wasFinished'].toString();
    addedTimePeriod1 = json['addedTime_period1'];
    addedTimePeriod2 = json['addedTime_period2'];
    injuryminute = json['injuryminute'] ?? '';
    injurytime = json['injurytime'] ?? '';
    notFromLiveFeed = json['notFromLiveFeed'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['time'] = this.time;
    data['status'] = this.status;
    data['gs_visitorteamid'] = this.gsVisitorteamid;
    data['gs_localteamid'] = this.gsLocalteamid;
    data['localteamid'] = this.localteamid;
    data['visitorteamid'] = this.visitorteamid;
    data['ht'] = this.ht;
    data['date'] = this.date;
    data['scoretime'] = this.scoretime;
    data['localteam'] = this.localteam;
    data['visitorteam'] = this.visitorteam;
    data['leagueid'] = this.leagueid;
    data['leaguename'] = this.leaguename;
    data['filegroup'] = this.filegroup;
    data['stageRound'] = this.stageRound;
    data['stageName'] = this.stageName;
    data['stageId'] = this.stageId;
    data['week'] = this.week;
    data['leagueKey'] = this.leagueKey;
    data['hi'] = this.hi;
    data['localteam_org'] = this.localteamOrg;
    data['visitorteam_org'] = this.visitorteamOrg;
    data['iw'] = this.iw;

    data['wasFinished'] = this.wasFinished;
    data['addedTime_period1'] = this.addedTimePeriod1;
    data['addedTime_period2'] = this.addedTimePeriod2;
    data['injuryminute'] = this.injuryminute;
    data['injurytime'] = this.injurytime;
    data['notFromLiveFeed'] = this.notFromLiveFeed;
    return data;
  }
}
