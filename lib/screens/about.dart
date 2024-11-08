import 'package:flutter/material.dart';
import '../../common/services/utils.dart';
import '../support/app_config.dart' as app_config;
// import '../support/app_config.dart' as app_config;
import '../common/widgets/common.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: mainAppBarWidget(context: context),
        body: Stack(children: <Widget>[
          // const AppBackgroundImage(),
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 32, right: 32, bottom: 0),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const AppLogo(
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Column(
                        children: [
                          Text(
                            context.lwTranslate.aboutUs,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const Divider(),
                          Text(
                            context.lwTranslate.version,
                          ),
                          const Text(
                            app_config.version,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
