import 'dart:convert';

IdsResponse idsResponseFromJson(String str) => IdsResponse.fromJson(json.decode(str));

String idsResponseToJson(IdsResponse data) => json.encode(data.toJson());

class IdsResponse {
  int? success;
  List<AppIdData>? data;

  IdsResponse({
    this.success,
    this.data,
  });

  factory IdsResponse.fromJson(Map<String, dynamic> json) => IdsResponse(
    success: json["success"],
    data: json["data"] == null ? [] : List<AppIdData>.from(json["data"]!.map((x) => AppIdData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AppIdData {
  String? fbAppId;
  String? fbClientToken;
  String? appsFlyerKey;
  String? openAppSplash;
  String? openAppCommon;
  String? interstitialTags1;
  String? interstitialTags2;
  String? nativeTags1;
  String? nativeTags2;
  String? overlayNative;
  String? secondOpenAppSplash;
  String? secondOpenAppCommon;
  String? secondInterstitialTags1;
  String? secondInterstitialTags2;
  String? secondNativeTags1;
  String? secondNativeTags2;
  String? nativeImageUrl1;
  String? nativeImageUrl2;
  String? priorityOfAid;
  String? interClickBeForAid;
  String? nativeClickBeforeAid;
  String? showDialogBeforeAd;
  String? affiliateClickAid;
  String? affiliateAndInterBothAid;
  String? affiliateWebUrl1;
  String? affiliateWebUrl2;
  String? affiliateWebUrl3;
  String? affiliateWebUrl4;
  String? affiliateWebUrl5;
  String? privacyPolicy;
  String? termsOfConditions;
  String? countryAffiliateLink;
  String? apiRunpodUrl;
  String? subscriptionVideo;
  String? nativeadCount;
  String? showSocial;

  AppIdData({
    this.fbAppId,
    this.fbClientToken,
    this.appsFlyerKey,
    this.openAppSplash,
    this.openAppCommon,
    this.interstitialTags1,
    this.interstitialTags2,
    this.nativeTags1,
    this.nativeTags2,
    this.overlayNative,
    this.secondOpenAppSplash,
    this.secondOpenAppCommon,
    this.secondInterstitialTags1,
    this.secondInterstitialTags2,
    this.secondNativeTags1,
    this.secondNativeTags2,
    this.nativeImageUrl1,
    this.nativeImageUrl2,
    this.priorityOfAid,
    this.interClickBeForAid,
    this.nativeClickBeforeAid,
    this.showDialogBeforeAd,
    this.affiliateClickAid,
    this.affiliateAndInterBothAid,
    this.affiliateWebUrl1,
    this.affiliateWebUrl2,
    this.affiliateWebUrl3,
    this.affiliateWebUrl4,
    this.affiliateWebUrl5,
    this.privacyPolicy,
    this.countryAffiliateLink,
    this.apiRunpodUrl,
    this.nativeadCount,
    this.subscriptionVideo,
    this.termsOfConditions,
    this.showSocial,
  });

  factory AppIdData.fromJson(Map<String, dynamic> json) => AppIdData(
    fbAppId: json["fb_appid"],
    fbClientToken: json["fb_clienttoken"],
    appsFlyerKey: json["appsfyer_key"],
    openAppSplash: json["openapp_splash"],
    openAppCommon: json["openapp_comman"],
    interstitialTags1: json["interstitial_tags1"],
    interstitialTags2: json["interstitial_tags2"],
    nativeTags1: json["native_tags1"],
    nativeTags2: json["native_tags2"],
    overlayNative: json["overlay_native"],
    secondOpenAppSplash: json["second_openapp_splash"],
    secondOpenAppCommon: json["second_openapp_comman"],
    secondInterstitialTags1: json["second_interstitial_tags1"],
    secondInterstitialTags2: json["second_interstitial_tags2"],
    secondNativeTags1: json["second_native_tags1"],
    secondNativeTags2: json["second_native_tags2"],
    nativeImageUrl1: json["native_image_url1"],
    nativeImageUrl2: json["native_image_url2"],
    priorityOfAid: json["priorityofaid"],
    interClickBeForAid: json["interclickbeforeaid"],
    nativeClickBeforeAid: json["nativeclickbeforeaid"],
    showDialogBeforeAd: json["showdialogbeforead"],
    affiliateClickAid: json["affiliate_clickaid"],
    affiliateAndInterBothAid: json["affiliateandinterbothaid"],
    affiliateWebUrl1: json["affiliate_weburl1"],
    affiliateWebUrl2: json["affiliate_weburl2"],
    affiliateWebUrl3: json["affiliate_weburl3"],
    affiliateWebUrl4: json["affiliate_weburl4"],
    affiliateWebUrl5: json["affiliate_weburl5"],
    privacyPolicy: json["privacy_policy"],
    countryAffiliateLink: json["country_affiliatelink"],
    apiRunpodUrl: json["api_runpodurl"],
    subscriptionVideo: json["subvid_utl"],
    termsOfConditions: json["trmsof_use"],
    nativeadCount: json["nativead_count"],
    showSocial: json["show_social"],
  );

  Map<String, dynamic> toJson() => {
    "fb_appid": fbAppId,
    "fb_clienttoken": fbClientToken,
    "appsfyer_key": appsFlyerKey,
    "openapp_splash": openAppSplash,
    "openapp_comman": openAppCommon,
    "interstitial_tags1": interstitialTags1,
    "interstitial_tags2": interstitialTags2,
    "native_tags1": nativeTags1,
    "native_tags2": nativeTags2,
    "overlay_native": overlayNative,
    "second_openapp_splash": secondOpenAppSplash,
    "second_openapp_comman": secondOpenAppCommon,
    "second_interstitial_tags1": secondInterstitialTags1,
    "second_interstitial_tags2": secondInterstitialTags2,
    "second_native_tags1": secondNativeTags1,
    "second_native_tags2": secondNativeTags2,
    "native_image_url1": nativeImageUrl1,
    "native_image_url2": nativeImageUrl2,
    "priorityofaid": priorityOfAid,
    "interclickbeforeaid": interClickBeForAid,
    "nativeclickbeforeaid": nativeClickBeforeAid,
    "showdialogbeforead": showDialogBeforeAd,
    "affiliate_clickaid": affiliateClickAid,
    "affiliateandinterbothaid": affiliateAndInterBothAid,
    "affiliate_weburl1": affiliateWebUrl1,
    "affiliate_weburl2": affiliateWebUrl2,
    "affiliate_weburl3": affiliateWebUrl3,
    "affiliate_weburl4": affiliateWebUrl4,
    "affiliate_weburl5": affiliateWebUrl5,
    "privacy_policy": privacyPolicy,
    "country_affiliatelink": countryAffiliateLink,
    "api_runpodurl": apiRunpodUrl,
    "subvid_utl": subscriptionVideo,
    "termsof_url": termsOfConditions,
    "nativead_count": nativeadCount,
    "show_social": showSocial,
  };
}
