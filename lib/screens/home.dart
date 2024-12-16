import 'package:flutter/material.dart';
import '../common/services/auth.dart';
import 'landing.dart';
import 'user/login.dart';
import 'user/register.dart';
import '../common/services/utils.dart';
import '../support/app_theme.dart' as app_theme;
import '../common/widgets/common.dart';
import '../common/services/auth.dart' as auth;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future? getRefreshAuthInfo;
  late bool isFirstTimeFuture;

  @override
  void initState() {
    getRefreshAuthInfo = auth.fetchAuthInfo();
    isFirstTimeFuture = isFirstTimeUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const AppBackgroundImage(),
          Padding(
            padding: const EdgeInsets.only(
              top: 0,
              left: 32,
              right: 32,
              bottom: 0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const AppLogo(
                  height: 180,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: context.lwTranslate.welcome,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text(
                        context.lwTranslate.welcomeSmallMessage,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child:FutureBuilder(
                      future: Future.wait<dynamic>([
                        getRefreshAuthInfo!,
                        Future.value(isFirstTimeFuture),
                      ]),
                      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Align(
                            alignment: Alignment.center,
                            child: AppItemProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return const Center(
                            child: Text(
                              'An error occurred',
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }

                        if (snapshot.hasData) {
                          final bool isFirstTime = snapshot.data![1] as bool;

                          if (!isFirstTime && auth.isLoggedIn()) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              navigatePage(
                                context,
                                const LandingPage(),
                              );
                            });
                            return const SizedBox.shrink();
                          }

                          return Align(
                            alignment: Alignment.center,
                            child: isFirstTime
                                ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16.0,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        app_theme.secondary,
                                      ),
                                      onPressed: () async {
                                        await setFirstTimeUser(false);
                                        navigatePage(
                                          context,
                                          const LandingPage(),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          top: 12,
                                          bottom: 12,
                                        ),
                                        child: Text(
                                          context.lwTranslate.letsGo,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 26.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                                : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16.0,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        app_theme.secondary,
                                      ),
                                      onPressed: () {
                                        navigatePage(
                                          context,
                                          const LoginPage(),
                                        );
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          top: 12,
                                          bottom: 12,
                                        ),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 26.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 16.0),
                                  child: SizedBox(
                                      width: 300,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                          app_theme.secondary,
                                        ),
                                        onPressed: () {
                                          navigatePage(
                                            context,
                                            RegisterPage(),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 16.0,
                                            right: 16.0,
                                            top: 12,
                                            bottom: 12,
                                          ),
                                          child: Text(
                                            context.lwTranslate.register,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 26.0,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
