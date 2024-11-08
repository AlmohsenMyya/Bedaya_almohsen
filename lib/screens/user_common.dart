import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import '../common/services/utils.dart';
import '../common/widgets/common.dart';

import 'premium.dart';

class ProfileImageView extends StatelessWidget {
  const ProfileImageView(
      {super.key, required this.imageUrl, this.actions, this.title});
  final String imageUrl;
  final Text? title;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: actions,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            size: 24,
          ),
        ),
      ),
      body: PhotoView(
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.contained * 3,
        imageProvider: appCachedNetworkImageProvider(
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}

class InfoItemWidget extends StatelessWidget {
  const InfoItemWidget({
    super.key,
    required this.label,
    required this.value,
  });

  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return value == null
        ? Container()
        : Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: GestureDetector(
                    onTap: () {
                      if (label != null) {
                        Clipboard.setData(ClipboardData(text: label!));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('تم نسخ النص إلى الحافظة'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Text(
                      label ?? '',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 0.1,
                height: 28,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 20),
                  child: Text(
                    value ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10))
            ],
          );
  }
}

class BePremiumAlertInfo extends StatelessWidget {
  const BePremiumAlertInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PremiumBadgeWidget(
              size: 164,
            ),
            const Divider(
              height: 20,
            ),
            Text(
              context.lwTranslate.thisIsAPremiumFeatureToViewThisYouNeed,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  navigatePage(context, const PremiumPage());
                },
                child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 12,
                      bottom: 12,
                    ),
                    child: Text(context.lwTranslate.bePremiumNow,
                        style: const TextStyle(
                          // color: app_theme.text,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
