import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/routes/app_routes.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';
import 'package:football_live/utils/app_assets.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:football_live/utils/common_widget.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  final List<Map<String, String>> pages = [
    {
      'image': AppAssets.onboarding1Image,
      'animation': AppAssets.onboarding1Animation,
      'title': 'Rise of the Champions',
      'description':
          'Power, pride, and passion — relive the glory of true champions..',
    },
    {
      'image': AppAssets.onboarding2Image,
      'animation': AppAssets.onboarding2Animation,
      'title': 'FMoments That Made History',
      'description':
          'Precision and power collide in iconic game changing moments.',
    },
    {
      'image': AppAssets.onboarding3Image,
      'animation': AppAssets.onboarding3Animation,
      'title': 'Glory in Every Tackle',
      'description':
          'Victory through determination — dive into heroic performances.',
    },
  ];

  RxInt currentPage = 0.obs;

  void _onNextPressed() {
    if (pages.length - 1 > currentPage.value) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      AdHelper().showInterstitialAdOnClickEvent(() {
        Get.offAllNamed(AppRoutes.mainScreen);
      });
    }
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: pages.length,
            controller: pageController,
            onPageChanged: (value) {
              AdHelper().showInterstitialAdOnClickEvent(() {
                currentPage.value = value;
                pageController.animateToPage(
                  currentPage.value,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              });
            },
            itemBuilder: (context, index) => Stack(
              children: [
                Image.asset(
                  pages[index]['image']!,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),

                Column(
                  children: [
                    Container(height: 340.h, color: Colors.transparent),

                    // SizedBox(
                    //   height: index == 2 ? 250.w : 200.w,
                    //   width: index == 2 ? 250.w : 200.w,
                    //   child: Lottie.asset(
                    //     pages[index]['animation'] ?? '',
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    Text(
                      pages[index]['title']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      pages[index]['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: .7),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20.w),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(pages.length, (index) {
                      bool isSelected = currentPage.value != index;
                      return AnimatedContainer(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: !isSelected ? 13.w : 60.w,
                        height: 15.h,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            !isSelected ? 50 : 10,
                          ),
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.whiteColor,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              adManager
                  .showNativeAdsAd(AdType.nativeBig)
                  .paddingOnly(left: 20.w, right: 20.w),

              Align(
                alignment: Alignment.bottomCenter,

                child: GestureDetector(
                  onTap: _onNextPressed,
                  child: Container(
                    height: 56.h,
                    width: commonWidth,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ).paddingOnly(bottom: 20.h, left: 20.w, right: 20.w),
            ],
          ),
        ],
      ),
    );
  }
}
