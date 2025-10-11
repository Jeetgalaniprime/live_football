class PlayerModel {
  final String? id;
  final String? name;
  final String? firstname;
  final String? lastname;
  final String? team;
  final String? teamid;
  final String? nationality;
  final String? birthdate;
  final int? age;
  final String? birthcountry;
  final String? birthplace;
  final String? position;
  final String? weight;
  final String? height;
  final List<PlayerStatistics> statistics;
  final List<PlayerStatistics> statisticsCups;
  final List<PlayerStatistics> statisticsCupsIntl;
  final List<PlayerStatistics> statisticsIntl;
  final List<PlayerTrophy> trophies;
  final List<PlayerTransfer> transfers;
  final int? marketvalue;
  final String? preferredFoot;
  final String? commonname;
  final int? imagesavets;
  final List<String> sidelined;

  const PlayerModel({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.team,
    this.teamid,
    this.nationality,
    this.birthdate,
    this.age,
    this.birthcountry,
    this.birthplace,
    this.position,
    this.statistics = const [],
    this.statisticsCups = const [],
    this.statisticsCupsIntl = const [],
    this.statisticsIntl = const [],
    this.trophies = const [],
    this.transfers = const [],
    this.marketvalue,
    this.preferredFoot,
    this.commonname,
    this.imagesavets,
    this.weight,
    this.height,
    this.sidelined = const [],
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      team: json['team'] as String?,
      teamid: json['teamid'] as String?,
      nationality: json['nationality'] as String?,
      birthdate: json['birthdate'] as String?,
      age: json['age'] is String
          ? int.tryParse(json['age'])
          : json['age'] as int?,
      birthcountry: json['birthcountry'] as String?,
      birthplace: json['birthplace'] as String?,
      position: json['position'] as String?,
      weight: json['weight'] as String?,
      height: json['height'] as String?,
      statistics: (json['statistics'] as List<dynamic>?)
              ?.map((e) => PlayerStatistics.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      statisticsCups: (json['statisticsCups'] as List<dynamic>?)
              ?.map((e) => PlayerStatistics.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      statisticsCupsIntl: (json['statisticsCupsIntl'] as List<dynamic>?)
              ?.map((e) => PlayerStatistics.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      statisticsIntl: (json['statisticsIntl'] as List<dynamic>?)
              ?.map((e) => PlayerStatistics.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      trophies: (json['trophies'] as List<dynamic>?)
              ?.map((e) => PlayerTrophy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      transfers: (json['transfers'] as List<dynamic>?)
              ?.map((e) => PlayerTransfer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      marketvalue: json['marketvalue'] is String
          ? int.tryParse(json['marketvalue'])
          : json['marketvalue'] as int?,
      preferredFoot: json['preferredFoot'] as String?,
      commonname: json['commonname'] as String?,
      imagesavets: json['imagesavets'] is String
          ? int.tryParse(json['imagesavets'])
          : json['imagesavets'] as int?,
      sidelined: (json['sidelined'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'firstname': firstname,
        'lastname': lastname,
        'team': team,
        'teamid': teamid,
        'nationality': nationality,
        'birthdate': birthdate,
        'age': age,
        'birthcountry': birthcountry,
        'birthplace': birthplace,
        'position': position,
        'weight': weight,
        'height': height,
        'statistics': statistics.map((e) => e.toJson()).toList(),
        'statisticsCups': statisticsCups.map((e) => e.toJson()).toList(),
        'statisticsCupsIntl': statisticsCupsIntl.map((e) => e.toJson()).toList(),
        'statisticsIntl': statisticsIntl.map((e) => e.toJson()).toList(),
        'trophies': trophies.map((e) => e.toJson()).toList(),
        'transfers': transfers.map((e) => e.toJson()).toList(),
        'marketvalue': marketvalue,
        'preferredFoot': preferredFoot,
        'commonname': commonname,
        'imagesavets': imagesavets,
        'sidelined': sidelined,
      };
}

class PlayerStatistics {
  final String? name;
  final String? teamid;
  final String? league;
  final String? leagueid;
  final String? season;
  final int? minutes;
  final int? appearences;
  final int? lineups;
  final int? substituteIn;
  final int? substituteOut;
  final int? substitutesOnBench;
  final int? goals;
  final int? yellowcards;
  final int? yellowred;
  final int? redcards;

  const PlayerStatistics({
    this.name,
    this.teamid,
    this.league,
    this.leagueid,
    this.season,
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
  });

  factory PlayerStatistics.fromJson(Map<String, dynamic> json) {
    return PlayerStatistics(
      name: json['name'] as String?,
      teamid: json['teamid'] as String?,
      league: json['league'] as String?,
      leagueid: json['leagueid'] as String?,
      season: json['season'] as String?,
      minutes: _parseInt(json['minutes']),
      appearences: _parseInt(json['appearences']),
      lineups: _parseInt(json['lineups']),
      substituteIn: _parseInt(json['substitute_in']),
      substituteOut: _parseInt(json['substitute_out']),
      substitutesOnBench: _parseInt(json['substitutes_on_bench']),
      goals: _parseInt(json['goals']),
      yellowcards: _parseInt(json['yellowcards']),
      yellowred: _parseInt(json['yellowred']),
      redcards: _parseInt(json['redcards']),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'teamid': teamid,
        'league': league,
        'leagueid': leagueid,
        'season': season,
        'minutes': minutes,
        'appearences': appearences,
        'lineups': lineups,
        'substitute_in': substituteIn,
        'substitute_out': substituteOut,
        'substitutes_on_bench': substitutesOnBench,
        'goals': goals,
        'yellowcards': yellowcards,
        'yellowred': yellowred,
        'redcards': redcards,
      };

  static int? _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}

class PlayerTrophy {
  final String? country;
  final String? league;
  final String? leagueid;
  final String? status;
  final int? rank;
  final int? count;
  final String? seasons;
  final String? leagueKey;

  const PlayerTrophy({
    this.country,
    this.league,
    this.leagueid,
    this.status,
    this.rank,
    this.count,
    this.seasons,
    this.leagueKey,
  });

  factory PlayerTrophy.fromJson(Map<String, dynamic> json) {
    return PlayerTrophy(
      country: json['country'] as String?,
      league: json['league'] as String?,
      leagueid: json['leagueid'] as String?,
      status: json['status'] as String?,
      rank: _parseInt(json['rank']),
      count: _parseInt(json['count']),
      seasons: json['seasons'] as String?,
      leagueKey: json['leagueKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'country': country,
        'league': league,
        'leagueid': leagueid,
        'status': status,
        'rank': rank,
        'count': count,
        'seasons': seasons,
        'leagueKey': leagueKey,
      };

  static int? _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}

class PlayerTransfer {
  final String? date;
  final String? from;
  final String? fromId;
  final String? to;
  final String? toId;
  final String? type;

  const PlayerTransfer({
    this.date,
    this.from,
    this.fromId,
    this.to,
    this.toId,
    this.type,
  });

  factory PlayerTransfer.fromJson(Map<String, dynamic> json) {
    return PlayerTransfer(
      date: json['date'] as String?,
      from: json['from'] as String?,
      fromId: json['from_id'] as String?,
      to: json['to'] as String?,
      toId: json['to_id'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'from': from,
        'from_id': fromId,
        'to': to,
        'to_id': toId,
        'type': type,
      };
}
