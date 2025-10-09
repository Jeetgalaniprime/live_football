import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../../models/ids_response.dart';

class FacebookSDKManager {
  static const MethodChannel _channel = MethodChannel('facebook_config');
  static final bool _isInitialized = false;

  static Future<void> initializeFacebookSDK(AppIdData? responseData) async {
    try {
      if (responseData != null && responseData.fbAppId != null) {
        await _channel.invokeMethod('updateFacebookConfig', {
          'appId': responseData.fbAppId,
          'clientToken': responseData.fbClientToken,
        });

        final isInitialized = await FacebookSDKManager.isSDKInitialized();
        debugPrint('Facebook SDK initialized: $isInitialized');

        await FacebookSDKManager.activateApp();
      } else {
        debugPrint('Failed to get Facebook App ID from API');
      }
    } catch (e) {
      debugPrint('Error initializing Facebook SDK: $e');
    }
  }

  static Future<bool> isSDKInitialized() async {
    if (!Platform.isIOS) return false;

    try {
      final result = await _channel.invokeMethod<bool>(
        'isFacebookSDKInitialized',
      );
      return result ?? false;
    } catch (e) {
      debugPrint('Check SDK Init Error: $e');
      return false;
    }
  }

  static Future<void> activateApp() async {
    if (!Platform.isIOS) return;

    try {
      await _channel.invokeMethod('activateApp');
    } catch (e) {
      debugPrint('ActivateApp Error: $e');
    }
  }

  // static Future<void> initializeAppsFlyer(String appsflyerKey) async {
  //   try {
  //     if (appsflyerKey.isNotEmpty) {
  //       final AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
  //         afDevKey: appsflyerKey,
  //         // appId: null,
  //         showDebug: kDebugMode,
  //         timeToWaitForATTUserAuthorization: 60,
  //       );
  //
  //       _appsflyerSdk = AppsflyerSdk(appsFlyerOptions);
  //
  //       // Initialize the SDK
  //       await _appsflyerSdk?.initSdk(
  //         registerConversionDataCallback: false,
  //         registerOnAppOpenAttributionCallback: false,
  //         registerOnDeepLinkingCallback: false,
  //       );
  //
  //       // Start AppsFlyer (equivalent to AppsFlyerLib.getInstance().start())
  //       _appsflyerSdk!.startSDK(
  //         onSuccess: () {
  //           // Equivalent to onSuccess() callback
  //           debugPrint(
  //             "LOG_TAG: Launch sent successfully, got 200 response code from server",
  //           );
  //           _isInitialized = true;
  //         },
  //         onError: (int errorCode, String errorDescription) {
  //           // Equivalent to onError(int i, @NonNull String s) callback
  //           debugPrint("LOG_TAG: Launch failed to be sent:");
  //           debugPrint("Error code: $errorCode");
  //           debugPrint("Error description: $errorDescription");
  //         },
  //       );
  //
  //       debugPrint('AppsFlyer SDK initialized with key: $appsflyerKey');
  //     } else {
  //       debugPrint('Failed to get AppsFlyer key from API');
  //     }
  //   } catch (e) {
  //     debugPrint('Error initializing AppsFlyer SDK: $e');
  //   }
  // }

  static bool get isInitialized => _isInitialized;
}
