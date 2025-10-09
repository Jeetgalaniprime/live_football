import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'service/mobile_ads/ad_helper.dart';
import 'service/mobile_ads/ad_ids.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLifecycleListener lifeCycleListener;

  @override
  void initState() {
    lifeCycleListener = AppLifecycleListener(
      onStateChange: _onLifeCycleChanged,
    );
    super.initState();
  }

  @override
  void dispose() {
    lifeCycleListener.dispose();
    super.dispose();
  }

  void _onLifeCycleChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.resumed:
        if (adManager.isDismissedInterAd.isFalse) {
          adManager.loadAppOpenAd(AdIds.appOpenFirst(true), true); 
        } else {
          adManager.isDismissedInterAd.value = false;
        }
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 954),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: AppColors.whiteColor,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: GetMaterialApp(
            // theme: ThemeData(fontFamily: 'IBMPlexSans'),
            getPages: AppPages.appPages,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.homeScreen,
          ),
        );
      },
    );
  }
}