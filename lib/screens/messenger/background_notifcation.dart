import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../common/services/auth.dart';
import '../../common/services/utils.dart';
import '../../main.dart';
import '../landing.dart';
import 'audio_video_calls.dart';
PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
String globalUid = "";
Future<void> showFullScreenNotification(Map receivedData) async {
  print("start jknkj.n.kj.klbik");
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    'call_channel_id', // Channel ID
    'Call Notifications', // Channel Name
    channelDescription: 'Notifications for incoming calls',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    enableVibration: true, // تفعيل الاهتزاز

  );

  const NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin
      .show(
    0,
    receivedData['callType'] == '2'
        ? 'Incoming Video Call'
        : 'Incoming Audio Call',
    "Call from ${receivedData['callerName']}",
    platformChannelSpecifics,
    payload: jsonEncode(receivedData), // Pass call data
  )
      .catchError((e) {
    print("jknkj.n.kj.klbik $e");
  });
}

// عرض إشعار محلي
Future<void> _showNotification(String message, bool isCall) async {
  AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    'call_channel_id', // معرف القناة
    'Call Notifications', // اسم القناة
    channelDescription: 'Notifications for calls', // وصف القناة
    importance: Importance.max, // أهمية الإشعار
    priority: Priority.high, // أولوية الإشعار
    ticker: 'ticker', // نص يظهر عند عرض الإشعار

    ongoing: isCall, // يجعل الإشعار ثابتًا إذا كان إشعار مكالمة
    autoCancel: !isCall, // لا يتم إلغاء الإشعار عند السحب إذا كان مكالمة
    playSound: true, // تفعيل الصوت الافتراضي
  );
  if (isCall) {
    FlutterRingtonePlayer().playRingtone();
  }
  NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0, // معرف الإشعار
    isCall ? 'Incoming Call' : 'New Notification', // العنوان
    message, // نص الإشعار
    platformChannelSpecifics, // تفاصيل الإشعار

  );
}

Future<void> initializeService(String uid) async {
  globalUid = uid ;
  print("stattetg jhb hjh, initializeService - global id $globalUid -- uid $uid");
 await Future.delayed(const Duration(seconds: 2));
  print("stattetg jhb hjh, initializeService - 22222 global id $globalUid -- uid $uid");
  final service = FlutterBackgroundService();
  // Create Notification Channel for Android 8.0 and above
  if (Platform.isAndroid) {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'call_channel_id', // id
      'Foreground Service', // name
      importance: Importance.high,
      description: 'This channel is used for foreground service notifications.',
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      autoStartOnBoot: true,
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      // Ensure the service stays in the foreground
      notificationChannelId: 'call_channel_id',
      initialNotificationTitle: 'تشغيل الخدمة',
      initialNotificationContent: 'يتم تشغيل التطبيق في الخلفية',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );

  service.startService();
  // تمرير `uid` إلى `onStart`
  service.invoke("setUserId", {"uid": uid});
}

// مطلوب فقط على iOS
@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  print("stattetg jhb hjh,b ,b ,b hb on start ");
  if (service is AndroidServiceInstance) {
    service.on("stopService").listen((event) {
      service.stopSelf();
    });
  }
  // استقبال `uid` عند تمريره من `initializeService`
  service.on("setUserId").listen((event)async {
    String uid = event?["uid"] ?? "";
    print("stattetg jhb hjh Received UID in onStart: $uid");

    await Future.delayed(const Duration(seconds: 5)); // تأخير لإعطاء وقت للخدمة للاستقرار
    initPlatformState();

  });
}


Future<void> initPlatformState() async {
  // إعداد إشعارات النظام
  await _initializeLocalNotifications();

  // إعداد Pusher
  await pusher.init(
    apiKey: configItem('services.pusher.apiKey'),
    cluster: configItem('services.pusher.cluster'),
    logToConsole: true,
  );
  await pusher.connect();


  // الاشتراك في القناة
  pusher.unsubscribe(channelName: "channel-${getAuthInfo('_uid')}");
  await pusher.subscribe(
      channelName: "channel-${getAuthInfo('_uid')}",
      onSubscriptionError: (error){
        print("stattetg jhb hjh onSubscriptionError $error ");
      },
      onEvent: (eventResponseData) async {
        print("Pusher notifications: $eventResponseData");

        Map receivedData = jsonDecode(eventResponseData.data);

        // إذا كان هناك إشعار برفض المكالمة
        if (eventResponseData.eventName == 'event.call.reject.notification') {
          FlutterRingtonePlayer().stop();
          await flutterLocalNotificationsPlugin.cancelAll();
        }

        // عرض الإشعار إذا كانت الخاصية showNotification موجودة
        if (receivedData['showNotification'] != null &&
            receivedData['showNotification'] == true) {
          _showNotification(
              receivedData['notificationMessage'] ??
                  receivedData['message'] ??
                  'New Notification',false
          );
        }

        // التعامل مع المكالمات
        if (eventResponseData.eventName == 'event.call.notification') {
          if (receivedData['type'] == 'caller-calling') {
            if (receivedData['callType'] == '1' || receivedData['callType'] == 1) {
              print("Voice call detected");
              _handleIncomingCall(receivedData, isVideoCall: false);
            } else if (receivedData['callType'] == '2' || receivedData['callType'] == 2) {
              print("Video call detected");
              _handleIncomingCall(receivedData, isVideoCall: true);
            }
          }
        }
      });
}

// إعداد إشعارات النظام
Future<void> _initializeLocalNotifications() async {
  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ),
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) async {
      String? payload = notificationResponse.payload;
      if (payload != null) {
        Map receivedData = jsonDecode(payload);
        // Show the call dialog
        SmartDialog.show(builder: (ctx) {
          return AudioVideoCall(
            connectionInfo: receivedData,
          );
        });
      }
    },
  );
}

// التعامل مع المكالمة
void _handleIncomingCall(Map receivedData,
    {required bool isVideoCall}) async
{
  print("callType -- start handling");
  // إذا كان التطبيق مفتوحًا
  SmartDialog.dismiss();
  SmartDialog.show(builder: (ctx) {
    return AudioVideoCall(
      connectionInfo: receivedData,
    );
  });

  // إذا كان التطبيق مغلقًا، قم بإظهار الإشعار مع بيانات المكالمة
  if (isVideoCall) {
    // showFullScreenNotification(receivedData);
    _showNotification("Video call from ${receivedData['callerName']}", true);
  } else {
    // showFullScreenNotification(receivedData);
    _showNotification("Audio call from ${receivedData['callerName']}", true);
  }
}

