import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/common_widget.dart';
import '../../models/ad_slot.dart';
import '../facebook_sdk/facebook_sdk_manager.dart';
import 'ad_ids.dart';

class AdHelper {
  static final AdHelper _instance = AdHelper._internal();

  factory AdHelper() => _instance;

  AdHelper._internal();
  RxBool isDismissedInterAd = true.obs;

  AppOpenAd? _appOpenAd;
  bool _isAppOpenAdShowing = false;
  final int _maxFailedLoadAttempts = 2;
  final RxInt clickCount = 1.obs;
  final RxBool isLoopActive = false.obs;
  final RxInt interstitialAdsClick = 0.obs;
  final RxInt nativeAdsClick = 1.obs;
  final RxInt nativeVideoAdCount = 0.obs;
  final RxBool showNativeAds = false.obs;

  static InterstitialAdSlot? firstSlot;
  static InterstitialAdSlot? secondSlot;
  static InterstitialAdSlot? thirdSlot;
  static InterstitialAdSlot? fourthSlot;

  static NativeAdSlot? firstSlotNativeBig;
  static NativeAdSlot? secondSlotNativeBig;
  static NativeAdSlot? thirdSlotNativeBig;
  static NativeAdSlot? fourthSlotNativeBig;

  static NativeAdSlot? firstSlotNativeMedium;
  static NativeAdSlot? secondSlotNativeMedium;
  static NativeAdSlot? thirdSlotNativeMedium;
  static NativeAdSlot? fourthSlotNativeMedium;

  static NativeAdSlot? firstSlotNativeSmall;
  static NativeAdSlot? secondSlotNativeSmall;
  static NativeAdSlot? thirdSlotNativeSmall;
  static NativeAdSlot? fourthSlotNativeSmall;
  final RxInt clickCountNative = 1.obs;

  clearAdVar() {
    firstSlot = null;
    secondSlot = null;
    thirdSlot = null;
    fourthSlot = null;
    firstSlotNativeBig = null;
    secondSlotNativeBig = null;
    thirdSlotNativeBig = null;
    fourthSlotNativeBig = null;
    firstSlotNativeMedium = null;
    secondSlotNativeMedium = null;
    thirdSlotNativeMedium = null;
    fourthSlotNativeMedium = null;
    firstSlotNativeSmall = null;
    secondSlotNativeSmall = null;
    thirdSlotNativeSmall = null;
    fourthSlotNativeSmall = null;
  }

  final AdRequest _request = const AdRequest(
    keywords: ['flutter', 'ads'],
    nonPersonalizedAds: false,
  );

  Future<void> initialize() async {
    unawaited(MobileAds.instance.initialize());
    await AdIds.getAdsIdsData();

    FacebookSDKManager.initializeFacebookSDK(AdIds.adIds);
    if (AdIds.countryAffiliateLink.isNotEmpty) {
      launchUrl(
        Uri.parse(AdIds.countryAffiliateLink),
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: WebViewConfiguration(enableJavaScript: true),
      ).then((value) {
        isDismissedInterAd.value = true;
      });
    } else {
      loadAppOpenAd(AdIds.appOpenFirst(false), false);
    }
    if (AdIds.priorityOfAd.value == 0) {
      preloadAllInterstitials();
    }

    preloadAllNativeAds();
  }

  void preloadAllNativeAds() {
    if (AdIds.nativeIOS1.isNotEmpty) {
      firstSlotNativeBig = NativeAdSlot(
        adUnitId: AdIds.nativeIOS1,
        slotCount: 1,
        adType: AdType.nativeBig,
      );
    }

    if (AdIds.nativeIOS2.isNotEmpty) {
      secondSlotNativeBig = NativeAdSlot(
        adUnitId: AdIds.nativeIOS2,
        slotCount: 2,
        adType: AdType.nativeBig,
      );
    }
    if (AdIds.secondNativeIOS1.isNotEmpty) {
      thirdSlotNativeBig = NativeAdSlot(
        adUnitId: AdIds.secondNativeIOS1,
        slotCount: 3,
        adType: AdType.nativeBig,
      );
    }

    if (AdIds.secondNativeIOS2.isNotEmpty) {
      fourthSlotNativeBig = NativeAdSlot(
        adUnitId: AdIds.secondNativeIOS2,
        slotCount: 4,
        adType: AdType.nativeBig,
      );
    }

    if (AdIds.nativeIOS1.isNotEmpty) {
      firstSlotNativeMedium = NativeAdSlot(
        adUnitId: AdIds.nativeIOS1,
        slotCount: 1,
        adType: AdType.nativeMedium,
      );
    }

    if (AdIds.nativeIOS2.isNotEmpty) {
      secondSlotNativeMedium = NativeAdSlot(
        adUnitId: AdIds.nativeIOS2,
        slotCount: 2,
        adType: AdType.nativeMedium,
      );
    }

    if (AdIds.secondNativeIOS1.isNotEmpty) {
      thirdSlotNativeMedium = NativeAdSlot(
        adUnitId: AdIds.secondNativeIOS1,
        slotCount: 3,
        adType: AdType.nativeMedium,
      );
    }

    if (AdIds.secondNativeIOS2.isNotEmpty) {
      fourthSlotNativeMedium = NativeAdSlot(
        adUnitId: AdIds.secondNativeIOS2,
        slotCount: 4,
        adType: AdType.nativeMedium,
      );
    }

    if (AdIds.nativeIOS1.isNotEmpty) {
      firstSlotNativeSmall = NativeAdSlot(
        adUnitId: AdIds.nativeIOS1,
        slotCount: 1,
        adType: AdType.nativeSmall,
      );
    }

    if (AdIds.nativeIOS2.isNotEmpty) {
      secondSlotNativeSmall = NativeAdSlot(
        adUnitId: AdIds.nativeIOS2,
        slotCount: 2,
        adType: AdType.nativeSmall,
      );
    }

    if (AdIds.secondNativeIOS1.isNotEmpty) {
      thirdSlotNativeSmall = NativeAdSlot(
        adUnitId: AdIds.secondNativeIOS1,
        slotCount: 3,
        adType: AdType.nativeSmall,
      );
    }

    if (AdIds.secondNativeIOS2.isNotEmpty) {
      fourthSlotNativeSmall = NativeAdSlot(
        adUnitId: AdIds.secondNativeIOS2,
        slotCount: 4,
        adType: AdType.nativeSmall,
      );
    }
    // load big native ads
    loadNativeAd(firstSlotNativeBig);
    loadNativeAd(secondSlotNativeBig);
    loadNativeAd(thirdSlotNativeBig);
    loadNativeAd(fourthSlotNativeBig);

    // load medium native ads
    loadNativeAd(firstSlotNativeMedium);
    loadNativeAd(secondSlotNativeMedium);
    loadNativeAd(thirdSlotNativeMedium);
    loadNativeAd(fourthSlotNativeMedium);

    // load small native ads
    loadNativeAd(firstSlotNativeSmall);
    loadNativeAd(secondSlotNativeSmall);
    loadNativeAd(thirdSlotNativeSmall);
    loadNativeAd(fourthSlotNativeSmall);
  }

  void showInterstitialAdOnClickEvent(Function()? onDone) {
    if (clickCount.value >= interstitialAdsClick.value) {
      showInterstitialAd(onDone);

      clickCount.value = 1;
    } else {
      clickCount.value++;
      onDone?.call();
    }
  }

  void preloadAllInterstitials() {
    //Set Interstitial Ads
    if (AdIds.interstitialIOS1.isNotEmpty) {
      firstSlot = InterstitialAdSlot(
        adUnitId: AdIds.interstitialIOS1,
        slotCount: 1,
      );
    }
    if (AdIds.interstitialIOS2.isNotEmpty) {
      secondSlot = InterstitialAdSlot(
        adUnitId: AdIds.interstitialIOS2,
        slotCount: 2,
      );
    }
    if (AdIds.secondInterstitialIOS1.isNotEmpty) {
      thirdSlot = InterstitialAdSlot(
        adUnitId: AdIds.secondInterstitialIOS1,
        slotCount: 3,
      );
    }
    if (AdIds.secondInterstitialIOS2.isNotEmpty) {
      fourthSlot = InterstitialAdSlot(
        adUnitId: AdIds.secondInterstitialIOS2,
        slotCount: 4,
      );
    }
    loadInterstitialAd(firstSlot);
    loadInterstitialAd(secondSlot);
    loadInterstitialAd(thirdSlot);
    loadInterstitialAd(fourthSlot);
  }

  void loadNativeAd(NativeAdSlot? slot) {
    if (slot == null) return;
    final nativeAd = NativeAd(
      adUnitId: slot.adUnitId,
      request: _request,
      factoryId: 'load_custom_native',
      customOptions: {
        'nativeAdLayoutType': slot.adType == AdType.nativeBig
            ? 1
            : slot.adType == AdType.nativeMedium
            ? 2
            : 3,
      },
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          slot.ad = ad as NativeAd;
          slot.retryCount = 0;
          debugPrint("Native Ad Load :- ${slot.adUnitId}");
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint("Failed to load Native Ad ${slot.adUnitId}: $error");
          ad.dispose(); // Dispose the failed ad
          slot.retryCount++;
          if (slot.retryCount < _maxFailedLoadAttempts) {
            loadNativeAd(slot); // Retry loading
          }
        },
        onAdClicked: (ad) {
          debugPrint("Native Ad Clicked");
        },
        onAdClosed: (ad) {
          debugPrint("Native Ad Closed");
          ad.dispose();
        },
        onAdOpened: (ad) {
          debugPrint("Native Ad Opened");
        },
        onAdImpression: (ad) {
          loadNativeAd(slot);
          debugPrint("Native Ad Impression");
        },
      ),
    );

    nativeAd.load();
  }

  Widget showNativeAdsAd(AdType adType) {
    if (clickCountNative.value >= nativeAdsClick.value) {
      clickCountNative.value = 1;
      if (AdIds.isFirstGroupNative.isTrue) {
        return _showAdFromGroupNative(
          adType == AdType.nativeBig
              ? firstSlotNativeBig
              : adType == AdType.nativeMedium
              ? firstSlotNativeMedium
              : firstSlotNativeSmall,
          adType == AdType.nativeBig
              ? thirdSlotNativeBig
              : adType == AdType.nativeMedium
              ? thirdSlotNativeMedium
              : firstSlotNativeSmall,
        );
      } else {
        return _showAdFromGroupNative(
          adType == AdType.nativeBig
              ? secondSlotNativeBig
              : adType == AdType.nativeMedium
              ? secondSlotNativeMedium
              : secondSlotNativeSmall,
          adType == AdType.nativeBig
              ? fourthSlotNativeBig
              : adType == AdType.nativeMedium
              ? fourthSlotNativeMedium
              : fourthSlotNativeSmall,
        );
      }
    } else {
      clickCountNative.value++;
      return SizedBox.shrink();
    }
  }

  Widget _showAdFromGroupNative(
    NativeAdSlot? primary,
    NativeAdSlot? secondary,
  ) {
    if (primary != null &&
        primary.ad != null &&
        (primary.ad as NativeAd).responseInfo != null) {
      debugPrint("Displaying Primary Ad: Slot ${primary.slotCount}");
      AdIds.isFirstGroupNative.toggle();
      return _buildNativeAdWidget(primary);
    } else if (secondary != null &&
        secondary.ad != null &&
        (secondary.ad as NativeAd).responseInfo != null) {
      debugPrint(
        "Primary Ad Not Available. Displaying Secondary Ad: Slot ${secondary.slotCount}",
      );
      AdIds.isFirstGroupNative.toggle();
      return _buildNativeAdWidget(secondary);
    } else {
      debugPrint("Neither primary nor secondary ad loaded for current group.");
      AdIds.isFirstGroupNative.toggle();
      return InkWell(
        onTap: () {
          qureka();
        },
        child: showNativeAdsImage(),
      );
    }
  }

  Widget _buildNativeAdWidget(NativeAdSlot slot) {
    return SizedBox(
      height: slot.adType == AdType.nativeBig
          ? 240.h
          : slot.adType == AdType.nativeMedium
          ? 170.h
          : 50.h,
      width: commonWidth,
      child: Center(child: AdWidget(ad: slot.ad!)),
    );
  }

  Widget showNativeAdsImage() {
    if (AdIds.isFirstGroupNative.isTrue && AdIds.nativeImageUrl1.isNotEmpty) {
      return Image.network(
        AdIds.nativeImageUrl1,
        height: 240.h,
        width: commonWidth,
        fit: BoxFit.cover,
      );
    } else {
      if (AdIds.nativeImageUrl2.isNotEmpty) {
        return Image.network(
          AdIds.nativeImageUrl2,
          height: 240.h,
          width: commonWidth,
          fit: BoxFit.cover,
        );
      }
    }
    return SizedBox.shrink();
  }

  void loadInterstitialAd(InterstitialAdSlot? slot) {
    if (slot == null) return;
    if (slot.ad != null) return;
    InterstitialAd.load(
      adUnitId: slot.adUnitId,
      request: _request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          slot.ad = ad;
          slot.retryCount = 0;
        },
        onAdFailedToLoad: (error) {
          debugPrint("Failed to load ${slot.adUnitId}: $error");
          slot.retryCount++;
          if (slot.retryCount < _maxFailedLoadAttempts) {
            loadInterstitialAd(slot);
          }
        },
      ),
    );
  }

  void showInterstitialAd(Function()? onDone) {
    if (AdIds.isFirstGroup.isTrue) {
      _showAdFromGroup(firstSlot, thirdSlot, onDone);
    } else {
      _showAdFromGroup(secondSlot, fourthSlot, onDone);
    }
  }

  void _showAdFromGroup(
    InterstitialAdSlot? primary,
    InterstitialAdSlot? secondary,
    Function()? onDone,
  ) {
    // debugPrint("Interstitial Ad Show :- ${primary?.slotCount}");
    _tryShowAd(
      primary,
      onDone: onDone,
      onFail: () {
        // debugPrint("Interstitial Ad Show :- ${secondary?.slotCount}");
        _tryShowAd(
          secondary,
          onDone: onDone,
          onFail: () async {
            debugPrint("Interstitial Ad qureka");
            await qureka();
            onDone?.call();
            AdIds.isFirstGroup.toggle();
          },
        );
      },
    );
  }

  void _tryShowAd(
    InterstitialAdSlot? slot, {
    VoidCallback? onFail,
    Function()? onDone,
  }) {
    if (slot?.ad != null) {
      slot!.ad!.fullScreenContentCallback = FullScreenContentCallback(
        onAdWillDismissFullScreenContent: (ad) {
          isDismissedInterAd.value = true;
          debugPrint("Interstitial dismissed");
        },
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          loadInterstitialAd(slot);
          onDone?.call();
          AdIds.isFirstGroup.toggle();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          loadInterstitialAd(slot);
          if (onFail != null) onFail();
        },
      );

      slot.ad?.show();
      slot.ad = null;
    } else {
      if (slot != null) loadInterstitialAd(slot);
      if (onFail != null) onFail();
    }
  }

  Future<void> qureka() async {
    final String url = AdIds.qureka;

    if (url.isEmpty) {
      debugPrint("Qureka URL is empty. Skipping launch.");
      return;
    }

    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ),
      );
    } else {
      debugPrint("Could not launch Qureka URL: $url");
    }
  }

  // void _createRewardedAd() {
  //   RewardedAd.load(
  //     adUnitId: AdUnitIds.rewarded,
  //     request: _request,
  //     rewardedAdLoadCallback: RewardedAdLoadCallback(
  //       onAdLoaded: (RewardedAd ad) {
  //         _rewardedAd = ad;
  //         _rewardedLoadAttempts = 0;
  //       },
  //       onAdFailedToLoad: (LoadAdError error) {
  //         _rewardedAd = null;
  //         _rewardedLoadAttempts++;
  //         if (_rewardedLoadAttempts < _maxFailedLoadAttempts) {
  //           _createRewardedAd();
  //         }
  //       },
  //     ),
  //   );
  // }
  //
  // void _showRewardedAd() {
  //   if (_rewardedAd == null) return;
  //
  //   _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdDismissedFullScreenContent: (ad) {
  //       ad.dispose();
  //       _createRewardedAd();
  //     },
  //     onAdFailedToShowFullScreenContent: (ad, error) {
  //       ad.dispose();
  //       _createRewardedAd();
  //     },
  //   );
  //
  //   _rewardedAd!.show(
  //     onUserEarnedReward: (ad, reward) {
  //       debugPrint('Reward earned: ${reward.amount} ${reward.type}');
  //     },
  //   );
  //
  //   _rewardedAd = null;
  // }

  void loadAppOpenAd(String? adUnitId, bool isCommon) {
    final primaryId = adUnitId ?? AdIds.appOpenFirst(false);
    final fallbackId = AdIds.appOpenSecond(isCommon);

    void load(String id, {required bool trySecondOnFail}) {
      AppOpenAd.load(
        adUnitId: id,
        request: _request,
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            _appOpenAd = ad;
            debugPrint("App Open Ad loaded: $id");
            showAppOpenAd();
          },
          onAdFailedToLoad: (error) {
            debugPrint('App Open Ad load failed for $id: $error');
            if (trySecondOnFail) {
              load(fallbackId, trySecondOnFail: false);
            }
          },
        ),
      );
    }

    load(primaryId, trySecondOnFail: true);
  }

  void showAppOpenAd() {
    if (_appOpenAd == null || _isAppOpenAdShowing) {
      return;
    }
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (_) => _isAppOpenAdShowing = true,
      onAdDismissedFullScreenContent: (ad) {
        _isAppOpenAdShowing = false;
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _isAppOpenAdShowing = false;
        ad.dispose();
      },
    );
    _appOpenAd!.show();
  }
}

class NativeAdPreloadService {
  static const MethodChannel _channel = MethodChannel('native_ad_channel');

  static Future<void> preloadNativeAd(String adUnitId) async {
    try {
      await _channel.invokeMethod('preload', {'adUnitId': adUnitId});
    } catch (e) {
      debugPrint('⚠️ Error preloading native ad: $e');
    }
  }
}

enum AdType { nativeSmall, nativeMedium, nativeBig }

AdHelper adManager = AdHelper();
