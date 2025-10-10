import 'package:football_live/screens/home_screen/bindings/home_binding.dart';
import 'package:football_live/screens/home_screen/ui/home_screen.dart';
import 'package:football_live/screens/home_screen/ui/home_tab/leagues_screen.dart';
import 'package:football_live/screens/home_screen/ui/home_tab/match_details_screen.dart'
    show MatchDetailsScreen;
import 'package:football_live/screens/home_screen/ui/home_tab/schedule_standing.dart';
import 'package:football_live/screens/home_screen/ui/leagues_details_screen.dart';
import 'package:football_live/screens/home_screen/ui/leagues_screen.dart';
import 'package:football_live/screens/home_screen/ui/team_details_screen.dart';
import 'package:football_live/screens/news_screen/news_details.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../routes/app_routes.dart';
import '../screens/splash_screen/splash_screen.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(name: AppRoutes.newsDetails, page: () => const NewsDetails()),
    GetPage(name: AppRoutes.leaguesScreen, page: () => const LeaguesScreen()),
    GetPage(
      name: AppRoutes.scheduleStandingScreen,
      page: () => const ScheduleStandingScreen(),
    ),
    GetPage(
      name: AppRoutes.matchDetailsScreen,
      page: () => const MatchDetailsScreen(),
    ),
    GetPage(name: AppRoutes.leaguesDetailsScreen, page: () => const LeaguesDetailsScreen()),
    GetPage(name: AppRoutes.teamDetailsScreen, page: () => const TeamDetailsScreen()),
  ];
}
