// main backup
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import './l10n/app_localizations.dart';
import 'common/services/locale_model.dart';
import 'common/services/utils.dart';
import './screens/home.dart';
import './screens/landing.dart';
import '../support/app_theme.dart' as app_theme;
import 'package:provider/provider.dart';

import 'support/app_locales.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void initializeNotifications() {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);

  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      // التعامل مع الضغط على الإشعار
      print('Notification clicked: ${response.payload}');
    },
  );
}

// list of available locales
List<Locale> supportedLocales = <Locale>[
  const Locale('en'),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await initPreferences();
  initializeNotifications();
  // list of available locales from config
  // List configLocales = configItem('locales', fallbackValue: []);
  if (appLocales.isNotEmpty) {
    for (var element in appLocales) {
      supportedLocales.add(Locale(element['code']));
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleModel(),
      child: Consumer<LocaleModel>(
          builder: (context, localeModel, child) => ResponsiveSizer(
                builder: (context, orientation, screenType) {
                  return MaterialApp(
                    title: 'Loveria',
                    theme: ThemeData(
                      // fontFamily: 'Fuzzy_Bubbles',
                      // This is the theme of your application.
                      //
                      // Try running your application with "flutter run". You'll see the
                      // application has a blue toolbar. Then, without quitting the app, try
                      // changing the primarySwatch below to Colors.green and then invoke
                      // "hot reload" (press "r" in the console where you ran "flutter run",
                      // or simply save your changes to "hot reload" in a Flutter IDE).
                      // Notice that the counter didn't reset back to zero; the application
                      // is not restarted.
                      useMaterial3: true,
                      brightness: Brightness.dark,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      canvasColor: const Color.fromARGB(240, 30, 30, 30),
                      primaryColor: app_theme.primary,
                      colorScheme: ColorScheme.fromSwatch(
                        errorColor: app_theme.error,
                        brightness: Brightness.dark,
                        primarySwatch: createMaterialColor(
                          app_theme.primary,
                        ),
                      ).copyWith(
                        surface: const Color.fromARGB(255, 19, 19, 19),
                      ),
                    ),
                    home: const HomePage(),
                    navigatorObservers: [FlutterSmartDialog.observer],
                    builder: FlutterSmartDialog.init(),
                    initialRoute: '/home',
                    debugShowCheckedModeBanner: false,
                    routes: <String, WidgetBuilder>{
                      "/landing": (BuildContext context) => const LandingPage(),
                      "/home": (BuildContext context) => const HomePage(),
                    },
                    // ...
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    // supportedLocales: AppLocalizations.supportedLocales,
                    supportedLocales: supportedLocales,
                    locale: (getPreferences('locale') != null)
                        ? Locale(getPreferences('locale'))
                        : null,
                  );
                },
              )),
    );
  }
}
