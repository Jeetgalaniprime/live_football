import 'dart:convert';

import 'package:flutter/material.dart';

class FeedModel {
  final List<FeedCountry> countries;
  final int? numberOfLeaguesPerCountry;
  final DefaultFavorites? defaultFavorites;
  final DefaultFavoritesV2? defaultFavoritesV2;
  final List<String> fixedCountries;
  final List<Tablelegendcolor> tablelegendcolors;
  final SpecialItems? specialItems;
  final int? fifaRankingStart;
  final int? fifaRankingEnd;
  final int? enableOnlineSearch;
  final int? enableStickyLeagues;
  final int? useSmartBanner;
  final int? offlineMode;
  final int? showSharingInMatch;
  final List<PaywallSkus> paywallSkus;
  final int? showPayIconAfterSessionTime;
  final int? showPayIconAfterSessionCount;
  final String? dataHost;
  final String? imageHostV2;
  final String? imageHostV3;
  final String? imageprefolder;
  final bool? forceShowLogos;
  final Interstitial? interstitialPerViews;
  final Interstitial? interstitialAfterMinutes;
  final int? intersitialMinScreensPerView;
  final VideoSearch? videoSearchQueryAppend;
  final VideoSearch? videoSearchSortMethod;
  final VideoSearch? videoSearchQueryAppendV2;
  final VideoSearch? videoSearchSortMethodV2;
  final VideoSearch? videoSearchQueryAppendV3;
  final VideoSearch? videoSearchSortMethodV3;
  final List<dynamic> supportedNewsSources;
  final List<String> supportedNewsSourcesV2;
  final Livestats? livestats;
  final int? showMatchChatV2;

  FeedModel({
    this.countries = const [],
    this.numberOfLeaguesPerCountry,
    this.defaultFavorites,
    this.defaultFavoritesV2,
    this.fixedCountries = const [],
    this.tablelegendcolors = const [],
    this.specialItems,
    this.fifaRankingStart,
    this.fifaRankingEnd,
    this.enableOnlineSearch,
    this.enableStickyLeagues,
    this.useSmartBanner,
    this.offlineMode,
    this.showSharingInMatch,
    this.paywallSkus = const [],
    this.showPayIconAfterSessionTime,
    this.showPayIconAfterSessionCount,
    this.dataHost,
    this.imageHostV2,
    this.imageHostV3,
    this.imageprefolder,
    this.forceShowLogos,
    this.interstitialPerViews,
    this.interstitialAfterMinutes,
    this.intersitialMinScreensPerView,
    this.videoSearchQueryAppend,
    this.videoSearchSortMethod,
    this.videoSearchQueryAppendV2,
    this.videoSearchSortMethodV2,
    this.videoSearchQueryAppendV3,
    this.videoSearchSortMethodV3,
    this.supportedNewsSources = const [],
    this.supportedNewsSourcesV2 = const [],
    this.livestats,
    this.showMatchChatV2,
  });

  factory FeedModel.fromRawJson(String str) =>
      FeedModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      livestats: json["livestats"] == null
          ? null
          : Livestats.fromJson(json["livestats"]),
      countries: json["countries"] == null
          ? []
          : List<FeedCountry>.from(
              json["countries"]!.map((x) => FeedCountry.fromJson(x)),
            ),
      numberOfLeaguesPerCountry: json["numberOfLeaguesPerCountry"],
      defaultFavorites: json["defaultFavorites"] == null
          ? null
          : DefaultFavorites.fromJson(json["defaultFavorites"]),
      defaultFavoritesV2: json["defaultFavoritesV2"] == null
          ? null
          : DefaultFavoritesV2.fromJson(json["defaultFavoritesV2"]),
      fixedCountries: json["fixedCountries"] == null
          ? []
          : List<String>.from(json["fixedCountries"]!.map((x) => x)),
      tablelegendcolors: json["tablelegendcolors"] == null
          ? []
          : List<Tablelegendcolor>.from(
              json["tablelegendcolors"]!.map(
                (x) => Tablelegendcolor.fromJson(x),
              ),
            ),
      specialItems: json["specialItems"] == null
          ? null
          : SpecialItems.fromJson(json["specialItems"]),
      fifaRankingStart: json["fifaRankingStart"],
      fifaRankingEnd: json["fifaRankingEnd"],
      enableOnlineSearch: json["enable_online_search"],
      enableStickyLeagues: json["enable_sticky_leagues"],
      useSmartBanner: json["use_smart_banner"],
      offlineMode: json["offline_mode"],
      showSharingInMatch: json["show_sharing_in_match"],
      paywallSkus: json["paywall_skus"] == null
          ? []
          : List<PaywallSkus>.from(
              json["paywall_skus"]!.map((x) => PaywallSkus.fromJson(x)),
            ),
      showPayIconAfterSessionTime: json["showPayIconAfterSessionTime"],
      showPayIconAfterSessionCount: json["showPayIconAfterSessionCount"],
      dataHost: json["data_host"],
      imageHostV2: json["image_host_v2"],
      imageHostV3: json["image_host_v3"],
      imageprefolder: json["imageprefolder"],
      forceShowLogos: json["forceShowLogos"],
      interstitialPerViews: json["interstitial_per_views"] == null
          ? null
          : Interstitial.fromJson(json["interstitial_per_views"]),
      interstitialAfterMinutes: json["interstitial_after_minutes"] == null
          ? null
          : Interstitial.fromJson(json["interstitial_after_minutes"]),
      intersitialMinScreensPerView: json["intersitial_min_screens_per_view"],
      videoSearchQueryAppend: json["video_search_query_append"] == null
          ? null
          : VideoSearch.fromJson(json["video_search_query_append"]),
      videoSearchSortMethod: json["video_search_sort_method"] == null
          ? null
          : VideoSearch.fromJson(json["video_search_sort_method"]),
      videoSearchQueryAppendV2: json["video_search_query_append_v2"] == null
          ? null
          : VideoSearch.fromJson(json["video_search_query_append_v2"]),
      videoSearchSortMethodV2: json["video_search_sort_method_v2"] == null
          ? null
          : VideoSearch.fromJson(json["video_search_sort_method_v2"]),
      videoSearchQueryAppendV3: json["video_search_query_append_v3"] == null
          ? null
          : VideoSearch.fromJson(json["video_search_query_append_v3"]),
      videoSearchSortMethodV3: json["video_search_sort_method_v3"] == null
          ? null
          : VideoSearch.fromJson(json["video_search_sort_method_v3"]),
      supportedNewsSources: json["supportedNewsSources"] == null
          ? []
          : List<dynamic>.from(json["supportedNewsSources"]!.map((x) => x)),
      supportedNewsSourcesV2: json["supportedNewsSources_v2"] == null
          ? []
          : List<String>.from(json["supportedNewsSources_v2"]!.map((x) => x)),

      showMatchChatV2: json["show_match_chat_v2"],
    );
  }

  Map<String, dynamic> toJson() => {
    "countries": countries.isEmpty
        ? []
        : List<dynamic>.from(countries.map((x) => x.toJson())),
    "numberOfLeaguesPerCountry": numberOfLeaguesPerCountry,
    "defaultFavorites": defaultFavorites?.toJson(),
    "defaultFavoritesV2": defaultFavoritesV2?.toJson(),
    "fixedCountries": fixedCountries.isEmpty
        ? []
        : List<dynamic>.from(fixedCountries.map((x) => x)),
    "tablelegendcolors": tablelegendcolors.isEmpty
        ? []
        : List<dynamic>.from(tablelegendcolors.map((x) => x.toJson())),
    "specialItems": specialItems?.toJson(),
    "fifaRankingStart": fifaRankingStart,
    "fifaRankingEnd": fifaRankingEnd,
    "enable_online_search": enableOnlineSearch,
    "enable_sticky_leagues": enableStickyLeagues,
    "use_smart_banner": useSmartBanner,
    "offline_mode": offlineMode,
    "show_sharing_in_match": showSharingInMatch,
    "paywall_skus": paywallSkus.isEmpty
        ? []
        : List<dynamic>.from(paywallSkus.map((x) => x.toJson())),
    "showPayIconAfterSessionTime": showPayIconAfterSessionTime,
    "showPayIconAfterSessionCount": showPayIconAfterSessionCount,
    "data_host": dataHost,
    "image_host_v2": imageHostV2,
    "image_host_v3": imageHostV3,
    "imageprefolder": imageprefolder,
    "forceShowLogos": forceShowLogos,
    "interstitial_per_views": interstitialPerViews?.toJson(),
    "interstitial_after_minutes": interstitialAfterMinutes?.toJson(),
    "intersitial_min_screens_per_view": intersitialMinScreensPerView,
    "video_search_query_append": videoSearchQueryAppend?.toJson(),
    "video_search_sort_method": videoSearchSortMethod?.toJson(),
    "video_search_query_append_v2": videoSearchQueryAppendV2?.toJson(),
    "video_search_sort_method_v2": videoSearchSortMethodV2?.toJson(),
    "video_search_query_append_v3": videoSearchQueryAppendV3?.toJson(),
    "video_search_sort_method_v3": videoSearchSortMethodV3?.toJson(),
    "supportedNewsSources": supportedNewsSources.isEmpty
        ? []
        : List<dynamic>.from(supportedNewsSources.map((x) => x)),
    "supportedNewsSources_v2": supportedNewsSourcesV2.isEmpty
        ? []
        : List<dynamic>.from(supportedNewsSourcesV2.map((x) => x)),
    "livestats": livestats?.toJson(),
    "show_match_chat_v2": showMatchChatV2,
  };
}

class FeedCountry {
  final List<CountryLeague> leagues;
  final String? country;

  FeedCountry({this.leagues = const [], this.country});

  factory FeedCountry.fromRawJson(String str) =>
      FeedCountry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeedCountry.fromJson(Map<String, dynamic> json) => FeedCountry(
    leagues: json["leagues"] == null
        ? []
        : List<CountryLeague>.from(
            json["leagues"].map((x) => CountryLeague.fromJson(x)),
          ),
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "leagues": leagues.isEmpty
        ? []
        : List<dynamic>.from(leagues.map((x) => x.toJson())),
    "country": country,
  };
}

class CountryLeague {
  final String? leagueName;
  final String? key;
  final int? idGs;

  CountryLeague({this.leagueName, this.key, this.idGs});

  factory CountryLeague.fromRawJson(String str) =>
      CountryLeague.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryLeague.fromJson(Map<String, dynamic> json) => CountryLeague(
    leagueName: json["leagueName"],
    key: json["key"],
    idGs: json["id_gs"],
  );

  Map<String, dynamic> toJson() => {
    "leagueName": leagueName,
    "key": key,
    "id_gs": idGs,
  };
}

class DefaultFavorites {
  final List<DefaultFavoritesDefault>? defaultFavoritesDefault;

  DefaultFavorites({this.defaultFavoritesDefault});

  factory DefaultFavorites.fromRawJson(String str) =>
      DefaultFavorites.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DefaultFavorites.fromJson(Map<String, dynamic> json) =>
      DefaultFavorites(
        defaultFavoritesDefault: json["default"] == null
            ? []
            : List<DefaultFavoritesDefault>.from(
                json["default"]!.map(
                  (x) => DefaultFavoritesDefault.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "default": defaultFavoritesDefault == null
        ? []
        : List<dynamic>.from(defaultFavoritesDefault!.map((x) => x.toJson())),
  };
}

class DefaultFavoritesDefault {
  final List<String> leagues;
  final String? country;

  DefaultFavoritesDefault({this.leagues = const [], this.country});

  factory DefaultFavoritesDefault.fromRawJson(String str) =>
      DefaultFavoritesDefault.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DefaultFavoritesDefault.fromJson(Map<String, dynamic> json) =>
      DefaultFavoritesDefault(
        leagues: json["leagues"] == null
            ? []
            : List<String>.from(json["leagues"]!.map((x) => x)),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
    "leagues": leagues.isEmpty ? [] : List<dynamic>.from(leagues.map((x) => x)),
    "country": country,
  };
}

class DefaultFavoritesV2 {
  final List<DefaultFavoritesV2Default> defaultFavoritesV2Default;

  DefaultFavoritesV2({this.defaultFavoritesV2Default = const []});

  factory DefaultFavoritesV2.fromRawJson(String str) =>
      DefaultFavoritesV2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DefaultFavoritesV2.fromJson(Map<String, dynamic> json) =>
      DefaultFavoritesV2(
        defaultFavoritesV2Default: json["default"] == null
            ? []
            : List<DefaultFavoritesV2Default>.from(
                json["default"]!.map(
                  (x) => DefaultFavoritesV2Default.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "default": defaultFavoritesV2Default.isEmpty
        ? []
        : List<dynamic>.from(defaultFavoritesV2Default.map((x) => x.toJson())),
  };
}

class DefaultFavoritesV2Default {
  final List<DefaultLeague> leagues;
  final String? country;

  DefaultFavoritesV2Default({this.leagues = const [], this.country});

  factory DefaultFavoritesV2Default.fromRawJson(String str) =>
      DefaultFavoritesV2Default.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DefaultFavoritesV2Default.fromJson(Map<String, dynamic> json) =>
      DefaultFavoritesV2Default(
        leagues: json["leagues"] == null
            ? []
            : List<DefaultLeague>.from(
                json["leagues"]!.map((x) => DefaultLeague.fromJson(x)),
              ),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
    "leagues": leagues.isEmpty
        ? []
        : List<dynamic>.from(leagues.map((x) => x.toJson())),
    "country": country,
  };
}

class DefaultLeague {
  final String? leagueName;
  final String? key;

  DefaultLeague({this.leagueName, this.key});

  factory DefaultLeague.fromRawJson(String str) =>
      DefaultLeague.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DefaultLeague.fromJson(Map<String, dynamic> json) =>
      DefaultLeague(leagueName: json["leagueName"], key: json["key"]);

  Map<String, dynamic> toJson() => {"leagueName": leagueName, "key": key};
}

class Interstitial {
  final int? interstitialDefault;
  final int? netherlands;
  final int? england;

  Interstitial({this.interstitialDefault, this.netherlands, this.england});

  factory Interstitial.fromRawJson(String str) =>
      Interstitial.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Interstitial.fromJson(Map<String, dynamic> json) => Interstitial(
    interstitialDefault: json["default"],
    netherlands: json["Netherlands"],
    england: json["England"],
  );

  Map<String, dynamic> toJson() => {
    "default": interstitialDefault,
    "Netherlands": netherlands,
    "England": england,
  };
}

class Livestats {
  final List<String> countries;
  final List<String> leagues;
  final List<String> teams;

  Livestats({
    this.countries = const [],
    this.leagues = const [],
    this.teams = const [],
  });

  factory Livestats.fromRawJson(String str) =>
      Livestats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Livestats.fromJson(Map<String, dynamic> json) {
    try {
      return Livestats(
        countries: (json["countries"] == null || json["countries"] is! List)
            ? []
            : List<String>.from(json["countries"].map((x) => x)),
        leagues: (json["leagues"] == null || json["leagues"] is! List)
            ? []
            : List<String>.from(json["leagues"].map((x) => x)),
        teams: (json["teams"] == null || json["teams"] is! List)
            ? []
            : List<String>.from(json["teams"].map((x) => x)),
      );
    } catch (e, st) {
      debugPrint('Error: $e, $st');
      throw Exception('Error: $e, $st');
    }
  }

  Map<String, dynamic> toJson() => {
    "countries": countries.isEmpty
        ? []
        : List<dynamic>.from(countries.map((x) => x)),
    "leagues": leagues.isEmpty ? [] : List<dynamic>.from(leagues.map((x) => x)),
    "teams": teams.isEmpty ? [] : List<dynamic>.from(teams.map((x) => x)),
  };
}

class PaywallSkus {
  final String? sku;
  final int? visible;

  PaywallSkus({this.sku, this.visible});

  factory PaywallSkus.fromRawJson(String str) =>
      PaywallSkus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaywallSkus.fromJson(Map<String, dynamic> json) =>
      PaywallSkus(sku: json["sku"], visible: json["visible"]);

  Map<String, dynamic> toJson() => {"sku": sku, "visible": visible};
}

class SpecialItems {
  final List<Entertainment> entertainment;

  SpecialItems({this.entertainment = const []});

  factory SpecialItems.fromRawJson(String str) =>
      SpecialItems.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SpecialItems.fromJson(Map<String, dynamic> json) => SpecialItems(
    entertainment: json["entertainment"] == null
        ? []
        : List<Entertainment>.from(
            json["entertainment"].map((x) => Entertainment.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "entertainment": entertainment.isEmpty
        ? []
        : List<dynamic>.from(entertainment.map((x) => x.toJson())),
  };
}

class Entertainment {
  final Title? title;
  final String? url;
  final String? image;

  Entertainment({this.title, this.url, this.image});

  factory Entertainment.fromRawJson(String str) =>
      Entertainment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Entertainment.fromJson(Map<String, dynamic> json) => Entertainment(
    title: json["title"] == null ? null : Title.fromJson(json["title"]),
    url: json["url"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "title": title?.toJson(),
    "url": url,
    "image": image,
  };
}

class Title {
  final String? titleDefault;
  final String? it;
  final String? nl;
  final String? fr;
  final String? de;
  final String? ru;
  final String? ar;
  final String? ja;
  final String? ko;
  final String? zh;
  final String? es;
  final String? pt;
  final String? pl;

  Title({
    this.titleDefault,
    this.it,
    this.nl,
    this.fr,
    this.de,
    this.ru,
    this.ar,
    this.ja,
    this.ko,
    this.zh,
    this.es,
    this.pt,
    this.pl,
  });

  factory Title.fromRawJson(String str) => Title.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    titleDefault: json["default"],
    it: json["it"],
    nl: json["nl"],
    fr: json["fr"],
    de: json["de"],
    ru: json["ru"],
    ar: json["ar"],
    ja: json["ja"],
    ko: json["ko"],
    zh: json["zh"],
    es: json["es"],
    pt: json["pt"],
    pl: json["pl"],
  );

  Map<String, dynamic> toJson() => {
    "default": titleDefault,
    "it": it,
    "nl": nl,
    "fr": fr,
    "de": de,
    "ru": ru,
    "ar": ar,
    "ja": ja,
    "ko": ko,
    "zh": zh,
    "es": es,
    "pt": pt,
    "pl": pl,
  };
}

class Tablelegendcolor {
  final String? name;
  final String? color;

  Tablelegendcolor({this.name, this.color});

  factory Tablelegendcolor.fromRawJson(String str) =>
      Tablelegendcolor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tablelegendcolor.fromJson(Map<String, dynamic> json) =>
      Tablelegendcolor(name: json["name"], color: json["color"]);

  Map<String, dynamic> toJson() => {"name": name, "color": color};
}

class VideoSearch {
  final String? teams;
  final String? players;
  final String? matches;

  VideoSearch({this.teams, this.players, this.matches});

  factory VideoSearch.fromRawJson(String str) =>
      VideoSearch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideoSearch.fromJson(Map<String, dynamic> json) => VideoSearch(
    teams: json["teams"],
    players: json["players"],
    matches: json["matches"],
  );

  Map<String, dynamic> toJson() => {
    "teams": teams,
    "players": players,
    "matches": matches,
  };
}
