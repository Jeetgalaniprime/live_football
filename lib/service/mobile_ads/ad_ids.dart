import 'dart:convert';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../service/mobile_ads/ad_helper.dart';
import '../../models/ids_response.dart';
import '../api/api_ids.dart';

class AdIds {
  static AppIdData? adIds;

  static RxInt qurekaAdCount = 0.obs;
  static RxBool isFirstGroupNative = true.obs;
  static String nativeIOS1 = '';
  static String nativeIOS2 = '';
  static String secondNativeIOS1 = '';
  static String secondNativeIOS2 = '';
  static String nativeImageUrl1 = '';
  static String nativeImageUrl2 = '';

  static String qurekaIOS1 = '';
  static String qurekaIOS2 = '';
  static String qurekaIOS3 = '';
  static String qurekaIOS4 = '';
  static String qurekaIOS5 = '';

  static String appOpenIOS1 = '';
  static String appOpenIOS2 = '';

  static String commonAppOpenIOS1 = '';
  static String commonAppOpenIOS2 = '';

  static RxBool isFirstGroup = true.obs;
  static String interstitialIOS1 = '';
  static String interstitialIOS2 = '';
  static String secondInterstitialIOS1 = '';
  static String secondInterstitialIOS2 = '';

  static String privacyPolicy = '';
  static String termsAndConditions = '';
  static String countryAffiliateLink = '';

  static RxInt qurekaAd = 1.obs;
  static RxInt priorityOfAd = 0.obs;
  static RxInt affiliateClickAd = 0.obs;
  static RxString showSocial = ''.obs;

  static String get qureka {
    final urls = [qurekaIOS1, qurekaIOS2, qurekaIOS3, qurekaIOS4, qurekaIOS5];

    int index = (qurekaAdCount.value - 1) % urls.length;

    qurekaAdCount.value++;

    return urls[index];
  }

  static Future<void> getAdsIdsData() async {
    String? countryCode = await getCountryCode();
    if (countryCode != null && countryCode.isNotEmpty) {
      final url = Uri.parse(ApiIds.adIds);

      final Map<String, dynamic> bodyParams = {
        "packagename": "com.football.livefootballscore",
        "country": countryCode,
      };

      final response = await http.post(url, body: bodyParams);
      if (response.statusCode == 200) {
        IdsResponse data = IdsResponse.fromJson(json.decode(response.body));
        adIds = data.data != null && (data.data ?? []).isNotEmpty
            ? data.data?.first
            : null;
        if (adIds != null) {
          priorityOfAd.value = int.parse(adIds?.priorityOfAid ?? '0');
          adManager.interstitialAdsClick.value = int.parse(
            priorityOfAd.value == 0
                ? adIds?.interClickBeForAid ?? '0'
                : adIds?.affiliateClickAid ?? '0',
          );
          adManager.nativeAdsClick.value = int.parse(
            adIds?.nativeClickBeforeAid ?? '0',
          );
          adManager.nativeVideoAdCount.value = int.parse(
            adIds?.nativeadCount ?? '0',
          );

          appOpenIOS1 = adIds?.openAppSplash ?? '';
          commonAppOpenIOS1 = adIds?.openAppCommon ?? '';

          interstitialIOS1 = adIds?.interstitialTags1 ?? '';
          secondInterstitialIOS1 = adIds?.secondInterstitialTags2 ?? '';
          interstitialIOS2 = adIds?.interstitialTags2 ?? '';
          secondInterstitialIOS2 = adIds?.secondInterstitialTags2 ?? '';

          nativeIOS1 = adIds?.nativeTags1 ?? '';
          secondNativeIOS1 = adIds?.secondNativeTags1 ?? '';
          nativeIOS2 = adIds?.nativeTags2 ?? '';
          secondNativeIOS2 = adIds?.secondNativeTags2 ?? '';
          nativeImageUrl1 = adIds?.nativeImageUrl1 ?? '';
          nativeImageUrl2 = adIds?.nativeImageUrl2 ?? '';

          qurekaIOS1 = adIds?.affiliateWebUrl1 ?? '';
          qurekaIOS2 = adIds?.affiliateWebUrl2 ?? '';
          qurekaIOS3 = adIds?.affiliateWebUrl3 ?? '';
          qurekaIOS4 = adIds?.affiliateWebUrl4 ?? '';
          qurekaIOS5 = adIds?.affiliateWebUrl5 ?? '';

          countryAffiliateLink = adIds?.countryAffiliateLink ?? '';

          privacyPolicy = adIds?.privacyPolicy ?? '';
          termsAndConditions = adIds?.termsOfConditions ?? '';
          showSocial.value = adIds?.showSocial ?? 'true';
        }
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  static Future<String?> getCountryCode() async {
    final url = Uri.parse(ApiIds.getCountry);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      await CountryCodes.init();
      final CountryDetails details = CountryCodes.detailsForLocale();
      return details.alpha2Code;
    }
  }

  static String appOpenFirst(bool isCommon) {
    if (isCommon == false) {
      return appOpenIOS1;
    } else if (isCommon == true) {
      return commonAppOpenIOS1;
    }
    return '';
  }

  static String appOpenSecond(bool isCommon) {
    if (isCommon == false) {
      return appOpenIOS2;
    } else if (isCommon == true) {
      return commonAppOpenIOS2;
    }
    return '';
  }
}
