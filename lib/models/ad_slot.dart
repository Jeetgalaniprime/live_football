import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../service/mobile_ads/ad_helper.dart';

class InterstitialAdSlot {
  InterstitialAd? ad;
  int retryCount = 0;
  final String adUnitId;
  int slotCount;

  InterstitialAdSlot({required this.adUnitId, required this.slotCount});
}

class NativeAdSlot {
  NativeAd? ad;
  int retryCount = 0;
  final String adUnitId;
  int slotCount = 0;
  final AdType adType;

  NativeAdSlot({
    required this.adUnitId,
    required this.slotCount,
    required this.adType,
  });
}
