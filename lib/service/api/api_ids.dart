class ApiIds {
  static String adIds =
      'http://primesoftech.in/ios_downloader/getarray_iosvideodownloader1.php';
  static String getCountry = 'https://ipapi.co/country';
  static String baseUrl = 'http://static.holoduke.nl/footapi/news/';
  static String baseUrl1 = 'https://static.holoduke.nl/footapi/fixtures/';
  static String baseUrl2 = 'https://holoduke.nl/footapi/matches/';

  static String getNews = 'US.json';
  static String getFeed = 'feed_appstart.json';

  static String getleagueSchedule(String leagueKey) =>
      '${leagueKey}_small.json';

  static String getMatchDetails(String matchId) => '$matchId.json';
}
