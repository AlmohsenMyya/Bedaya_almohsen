import 'dart:async';
import 'dart:convert';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:bedaya/screens/premium.dart';
import 'package:bedaya/screens/user_common.dart';
import 'messenger/audio_video_calls.dart';
import 'user/login.dart';
import '../common/services/auth.dart';
import 'encounter.dart';
import '../common/services/utils.dart';
import '../common/widgets/common.dart';
import 'messenger/messenger.dart';
import 'my_photos.dart';
import 'profile_details.dart';
import 'users_list.dart';
import '../common/services/auth.dart' as auth;
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:android_intent_plus/android_intent.dart';

class LandingPage extends StatefulWidget {
  const LandingPage(
      {super.key,
      this.initialNotificationCount = 0,
      this.initialActiveTab = 2});

  final int initialNotificationCount;
  final int initialActiveTab;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

int notificationCount = 0;
String tabTitle = '';

class _LandingPageState extends State<LandingPage> with WidgetsBindingObserver {
  Future? _fetchMyData;
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  InterstitialAd? _interstitialAd;
  String _adUnitId = '';
  bool enableAds = true;

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    setTabTitle(widget.initialActiveTab);
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      if (configItem('ads.interstitial_id.enable', fallbackValue: false) ==
          true) {
        _adUnitId = configItem(
            'ads.interstitial_id.${isIOSPlatform() ? 'ios' : 'android'}_ad_unit_id',
            fallbackValue: '');
      }

      notificationCount = widget.initialNotificationCount;
      _fetchMyData = checkUserLoggedIn();
      initPlatformState();
      FBroadcast.instance().register('local.broadcast.notification_count',
          (eventNotificationCount, callback) {
        setState(() {
          notificationCount = eventNotificationCount;
        });
      });
      enableAds = (_adUnitId != '') &&
          (getAuthInfo(
                  'additional_user_info.features_availability.no_ads', false) !=
              true);
      WidgetsBinding.instance.addObserver(this);
      if (enableAds) {
        Future.delayed(
            const Duration(
              seconds: 15,
            ), () {
          // initial ad load
          _loadInterstitialAd();
          _interstitialAd?.show();
        });
        // show add every 3 minutes
        Timer.periodic(
            Duration(
                seconds: configItem(
              'ads.interstitial_id.frequency_in_seconds',
              fallbackValue: 180,
            )), (timer) {
          _loadInterstitialAd();
          _interstitialAd?.show();
        });
      }
    }
  }

  @override
  void dispose() {
    if (mounted) {
      WidgetsBinding.instance.removeObserver(this);

      /// remove all receivers from the environment
      FBroadcast.instance().unregister(this);
      _interstitialAd?.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      auth.refreshUserInfo();
    }
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> showFullScreenNotification(Map receivedData) async {
    print("start jknkj.n.kj.klbik");
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'call_channel_id', // Channel ID
      'Call Notifications', // Channel Name
      channelDescription: 'Notifications for incoming calls',
      importance: Importance.max,
      priority: Priority.high,
      fullScreenIntent: true, // Make it a full-screen notification
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
      playSound: !isCall, // تفعيل الصوت الافتراضي
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


  Future<void> initPlatformState() async {
    // إعداد إشعارات النظام
    await _initializeLocalNotifications();

    // إعداد Pusher
    await pusher.init(
      apiKey: configItem('services.pusher.apiKey'),
      cluster: configItem('services.pusher.cluster'),
      logToConsole: configItem('debug'),
    );
    await pusher.connect();

    // الاشتراك في القناة
    pusher.unsubscribe(channelName: "channel-${getAuthInfo('_uid')}");
    await pusher.subscribe(
        channelName: "channel-${getAuthInfo('_uid')}",
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
      {required bool isVideoCall}) async {
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

  Future<void> bringAppToForeground(Map receivedData) async {
    const AndroidIntent intent = AndroidIntent(
      action: 'android.intent.action.MAIN',
      category: 'android.intent.category.LAUNCHER',
      package: 'your.app.package.name', // Replace with your app package name
    );
    await intent.launch();

    // Show the call dialog after the app is in the foreground
    SmartDialog.show(builder: (ctx) {
      return AudioVideoCall(
        connectionInfo: receivedData,
      );
    });
  }

  checkUserLoggedIn() async {
    await auth.redirectIfUnauthenticated(context);
    return isLoggedIn();
  }

  setTabTitle(i) {
    if (kDebugMode) {
      print('${userInfo}');
    }

    setState(() {
      switch (i) {
        case 0:
          tabTitle = context.lwTranslate.find;
          break;
        case 1:
          tabTitle = context.lwTranslate.myProfile;
          break;
        case 2:
          tabTitle = context.lwTranslate.encounter;
          break;
        case 3:
          tabTitle = context.lwTranslate.myPhotos;
          break;
        case 4:
          tabTitle = context.lwTranslate.messenger;
          break;
        default:
      }
    });
  }

  /// Loads an interstitial ad.
  void _loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (InterstitialAd ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});

            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            pr('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: mainAppBarWidget(
        title: tabTitle,
        context: context,
        notificationCount: notificationCount,
      ),
      body: Stack(
        children: [
          FutureBuilder(
              future: _fetchMyData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData &&
                    (snapshot.connectionState == ConnectionState.done)) {
                  if (snapshot.data == true) {
                    return DefaultTabController(
                      length: 5,
                      initialIndex: widget.initialActiveTab,
                      child: Scaffold(
                        body: Column(
                          children: [
                            Expanded(
                              child: TabBarView(
                                children: [
                                  const UsersListPage(),
                                  const ProfileDetailsPage(),
                                  const EncounterPage(),
                                  const MyPhotosPage(),
                                  !userInfo['is_premium']
                                      ? BePremiumAlertInfo()
                                      : MessengerPage()
                                ],
                              ),
                            ),
                          ],
                        ),
                        bottomNavigationBar: ConvexAppBar(
                          color: Colors.white,
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          items: const [
                            // Find
                            TabItem(
                              icon: CupertinoIcons.search,
                            ),
                            // my profile
                            TabItem(
                              icon: CupertinoIcons.person,
                            ),
                            // encounter
                            TabItem(
                              icon: CupertinoIcons.house_fill,
                            ),
                            // my photos
                            TabItem(
                              icon: CupertinoIcons.photo,
                            ),
                            // messenger
                            TabItem(
                              icon: Icons.telegram,
                            ),
                          ],
                          onTabNotify: (int i) {
                            setTabTitle(i);
                            return true;
                          },
                        ),
                      ),
                    );
                  } else {
                    return const LoginPage();
                  }
                } else {
                  return const Align(
                    alignment: Alignment.center,
                    child: AppItemProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
