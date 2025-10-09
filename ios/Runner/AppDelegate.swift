import UIKit
import Flutter
import FBSDKCoreKit
import google_mobile_ads


@main
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // 📦 Flutter plugin registration
    GeneratedPluginRegistrant.register(with: self)

    // ✅ Register custom native ad factory
    let factory = NativeAdFactory()
    FLTGoogleMobileAdsPlugin.registerNativeAdFactory(
      self,
      factoryId: "load_custom_native",
      nativeAdFactory: factory
    )

    // ✅ Facebook SDK MethodChannel
    if let controller = window?.rootViewController as? FlutterViewController {
      let channel = FlutterMethodChannel(name: "facebook_config", binaryMessenger: controller.binaryMessenger)

      channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        switch call.method {
        case "updateFacebookConfig":
          if let args = call.arguments as? [String: String],
             let appId = args["appId"],
             let clientToken = args["clientToken"] {
            
            Settings.shared.appID = appId
            Settings.shared.clientToken = clientToken
            Settings.shared.isAutoLogAppEventsEnabled = true
            ApplicationDelegate.shared.initializeSDK()
            result(true)
          } else {
            result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid Facebook config args", details: nil))
          }

        case "isFacebookSDKInitialized":
          let initialized = Settings.shared.appID != nil && !Settings.shared.appID!.isEmpty
          result(initialized)

        case "activateApp":
          AppEvents.shared.activateApp()
          result(true)

        default:
          result(FlutterMethodNotImplemented)
        }
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
