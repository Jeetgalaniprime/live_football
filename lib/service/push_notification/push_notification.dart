// import 'dart:io';
// import 'dart:ui';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   static final FirebaseMessaging _firebaseMessaging =
//       FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> initialize() async {
//     try {
//       await Firebase.initializeApp();
//       debugPrint('🔥 Firebase initialized ${isFirebaseInitialized()}');
//       await _requestPermission();
//       FlutterError.onError =
//           FirebaseCrashlytics.instance.recordFlutterFatalError;

//       PlatformDispatcher.instance.onError = (error, stack) {
//         FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//         return true;
//       };
//       FirebaseAnalytics.instanceFor(app: Firebase.app());

//       await _initializeLocalNotifications();

//       final token = await _firebaseMessaging.getToken();
//       debugPrint('🔑 FCM Token: $token');
//       // subscribeToFCMTopic();
//       // Background message handler
//       FirebaseMessaging.onBackgroundMessage(
//         NotificationService.firebaseMessagingBackgroundHandler,
//       );

//       // Foreground: trigger local notification
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         debugPrint('📩 Foreground message: ${message.notification?.title}');
//         _showLocalNotification(message);
//       });

//       // Background to foreground via notification click
//       FirebaseMessaging.onMessageOpenedApp.listen((message) {
//         debugPrint('📲 Notification tapped (background)');
//       });

//       // App launched from terminated state by tapping notification
//       final initialMessage = await _firebaseMessaging.getInitialMessage();
//       if (initialMessage != null) {
//         debugPrint('🚀 App launched from notification (terminated)');
//       }
//     } catch (e) {
//       debugPrint('❌ Notification permission declined');
//     }
//   }

//   static void subscribeToFCMTopic() async {
//     try {
//       await FirebaseMessaging.instance.subscribeToTopic(
//         "nfc_credit_card_validator",
//       );
//       debugPrint("✅ Subscribed to nfc_credit_card_validator");
//     } catch (e) {
//       debugPrint("❌ Failed to subscribe to topic: $e");
//     }
//   }

//   static Future<void> _requestPermission() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       debugPrint('✅ Notification permission granted');
//     } else {
//       debugPrint('❌ Notification permission declined');
//     }
//   }

//   static Future<void> _initializeLocalNotifications() async {
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const DarwinInitializationSettings iosSettings =
//         DarwinInitializationSettings();

//     const InitializationSettings initSettings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );

//     await _localNotifications.initialize(initSettings);
//   }

//   static bool isFirebaseInitialized() {
//     try {
//       Firebase.app();
//       return true;
//     } catch (e) {
//       debugPrint('❌ Firebase not initialized: $e');
//       return false;
//     }
//   }

//   /// Get Firebase initialization status with details
//   static Future<Map<String, dynamic>> getFirebaseStatus() async {
//     try {
//       final app = Firebase.app();
//       final token = await _firebaseMessaging.getToken();

//       return {
//         'isInitialized': true,
//         'appName': app.name,
//         'projectId': app.options.projectId,
//         'fcmToken': token,
//         'timestamp': DateTime.now().millisecondsSinceEpoch,
//       };
//     } catch (e) {
//       return {
//         'isInitialized': false,
//         'error': e.toString(),
//         'timestamp': DateTime.now().millisecondsSinceEpoch,
//       };
//     }
//   }

//   static void _showLocalNotification(RemoteMessage message) {
//     final notification = message.notification;

//     if (notification != null && (Platform.isAndroid || Platform.isIOS)) {
//       _localNotifications.show(
//         notification.hashCode,
//         notification.title ?? '',
//         notification.body ?? '',
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//             'fcm_channel',
//             'FCM Notifications',
//             importance: Importance.high,
//             priority: Priority.high,
//           ),
//           iOS: DarwinNotificationDetails(),
//         ),
//       );
//     }
//   }

//   /// Background message handler
//   static Future<void> firebaseMessagingBackgroundHandler(
//     RemoteMessage message,
//   ) async {
//     await Firebase.initializeApp();
//     debugPrint('🔴 Background message: ${message.messageId}');
//   }
// }
