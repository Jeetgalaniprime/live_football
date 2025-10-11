import 'package:football_live/screens/home_screen/bindings/home_binding.dart';
import 'package:football_live/screens/home_screen/ui/home_flow/player_details_screen.dart';
import 'package:football_live/screens/home_screen/ui/home_screen.dart';
import 'package:football_live/screens/home_screen/ui/home_flow/schedule/leagues_details_screen.dart';
import 'package:football_live/screens/home_screen/ui/home_flow/schedule/leagues_screen.dart';
import 'package:football_live/screens/home_screen/ui/home_flow/standing/team_details_screen.dart';
import 'package:football_live/screens/main_screen/main_screen.dart';
import 'package:football_live/screens/match_details_screen/bindings/match_detailes_binding.dart';
import 'package:football_live/screens/match_details_screen/view/match_details_screen.dart'
    show MatchDetailsScreen;
import 'package:football_live/screens/news_screen/news_details.dart';
import 'package:football_live/screens/point_table_screen/point_table_screen.dart';
import 'package:football_live/screens/ranking_screen/ranking_screen.dart';
import 'package:football_live/screens/stadium_screen/stadium_screen.dart';
import 'package:football_live/screens/winners_screen/winners_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../routes/app_routes.dart';
import '../screens/splash_screen/splash_screen.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.mainScreen, page: () => const MainScreen()),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(name: AppRoutes.newsDetails, page: () => const NewsDetails()),
    GetPage(name: AppRoutes.leaguesScreen, page: () => const LeaguesScreen()),
    GetPage(
      name: AppRoutes.matchDetailsScreen,
      page: () => const MatchDetailsScreen(),
      binding: MatchDetailesBinding(),
    ),
    GetPage(
      name: AppRoutes.leaguesDetailsScreen,
      page: () => const LeaguesDetailsScreen(),
    ),
    GetPage(
      name: AppRoutes.teamDetailsScreen,
      page: () => const TeamDetailsScreen(),
    ),
    GetPage(name: AppRoutes.leaguesDetailsScreen, page: () => const LeaguesDetailsScreen()),
    GetPage(name: AppRoutes.teamDetailsScreen, page: () => const TeamDetailsScreen()),
    GetPage(name: AppRoutes.playerDetailsScreen, page: () => const PlayerDetailsScreen()),
    GetPage(name: AppRoutes.winnersScreen, page: () => const WinnersScreen()),
    GetPage(name: AppRoutes.stadiumScreen, page: () => const StadiumScreen()),
    GetPage(name: AppRoutes.pointTableScreen, page: () => const PointTableScreen()),
    GetPage(name: AppRoutes.rankingScreen, page: () => const RankingScreen()),
    
  ];
}
