import 'dart:ui';

import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../screens/premium.dart';
import '../../screens/user/change_email.dart';
import '../../screens/user/change_password.dart';
import '../../screens/notification_list.dart';
import '../../screens/about.dart';
import '../../screens/booster.dart';
import '../../screens/landing.dart';
import '../../screens/profile_image_update.dart';
import '../../screens/user/user_settings.dart';
import '../../screens/user_common.dart';
import '../../screens/users_list.dart';
import '../../screens/wallet_transaction_list.dart';
import '../services/utils.dart';
import '../../support/app_theme.dart' as app_theme;
import './../services/data_transport.dart' as data_transport;
import './../services/auth.dart' as auth;

/// App background Image
/// Widget
class AppBackgroundImage extends StatelessWidget {
  const AppBackgroundImage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: app_theme.primaryGradient,
        image: DecorationImage(
          opacity: 0.4,
          image: app_theme.backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
        ),
      ),
    );
  }
}

///
/// App Logo Widget
class AppLogo extends StatelessWidget {
  final double height;
  const AppLogo({super.key, this.height = 250});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, child: app_theme.logoImage);
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: app_theme.sidebarBgColor,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: GestureDetector(
              onTap: () {
                navigatePage(
                  context,
                  const LandingPage(
                    initialActiveTab: 1,
                  ),
                );
              },
              child: Text(
                  '${auth.getAuthInfo('full_name')} (${auth.getAuthInfo('username')})'),
            ),
            accountEmail: Text(auth.getAuthInfo('email')),
            currentAccountPicture: GestureDetector(
              onTap: () {
                navigatePage(
                    context,
                    ProfileImageView(
                      title: Text(context.lwTranslate.profilePhoto),
                      imageUrl: auth.getAuthInfo('profile_picture_url'),
                      actions: [
                        IconButton(
                            icon: const Icon(Icons.edit),
                            tooltip: context.lwTranslate.uploadNewPhotos,
                            onPressed: () {
                              navigatePage(
                                context,
                                const ProfileImageUpdatePage(),
                              );
                            }),
                      ],
                    ));
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: appCachedNetworkImageProvider(
                      imageUrl: auth.getAuthInfo('profile_picture_url'),
                    ),
                  ),
                  if (auth.getAuthInfo('is_premium'))
                    Positioned(
                      top: 8,
                      right: 2,
                      child: GestureDetector(
                        onTap: () {
                          navigatePage(context, const PremiumPage());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: PremiumBadgeWidget(
                            size: 32,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
            decoration: const BoxDecoration(),
            otherAccountsPictures: [
              GestureDetector(
                onTap: () {
                  navigatePage(
                    context,
                    const AboutPage(),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: AppLogo(),
                ),
              ),
              // AppLogo(),
            ],
            otherAccountsPicturesSize: const Size.square(80),
          ),
          if (!auth.getAuthInfo('is_premium'))
            ListTile(
              leading: const PremiumBadgeWidget(
                size: 24,
                preventTap: true,
              ),
              title: Text(
                context.lwTranslate.bePremium,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Then close the drawer
                Navigator.pop(context);
                navigatePage(context, const PremiumPage());
              },
            ),
          ListTile(
            leading: const Icon(
              Icons.star,
              // color: Theme.of(context).primaryColor,
            ),
            title: Text(
              context.lwTranslate.menuFeaturedUsers,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              navigatePage(
                  context,
                  UsersListPage(
                    title: context.lwTranslate.menuFeaturedUsers,
                    pageBaseUrl: 'get-featured-user-data',
                  ));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.blender,
              // color: Theme.of(context).primaryColor,
            ),
            title: Text(
              context.lwTranslate.menuRandomUsers,
              style: const TextStyle(
                  // color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              navigatePage(
                  context,
                  UsersListPage(
                    title: context.lwTranslate.menuRandomUsers,
                    pageBaseUrl: 'random-user',
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.wallet),
            title: Text(context.lwTranslate.menuCreditWallet),
            onTap: () {
              Navigator.pop(context);
              navigatePage(
                context,
                const WalletTransactionListPage(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.thumb_up),
            title: Row(
              children: [
                Text(context.lwTranslate.menuWhoLikesMe),
                if (auth.getAuthInfo(
                        'additional_user_info.is_premium_only.show_likes',
                        false) ==
                    true)
                  const PremiumBadgeWidget(
                    size: 24,
                  )
              ],
            ),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              navigatePage(
                  context,
                  UsersListPage(
                    title: context.lwTranslate.menuWhoLikesMe,
                    pageBaseUrl: 'who-liked-me',
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.repeat),
            title: Text(context.lwTranslate.menuMutualLikes),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              navigatePage(
                  context,
                  UsersListPage(
                    title: context.lwTranslate.menuMutualLikes,
                    pageBaseUrl: 'mutual-likes',
                  ));
            },
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.heart),
            title: Text(context.lwTranslate.menuMyLikes),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              navigatePage(
                  context,
                  UsersListPage(
                    title: context.lwTranslate.menuMyLikes,
                    pageBaseUrl: 'my-likes',
                  ));
            },
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.heart_slash),
            title: Text(context.lwTranslate.menuMyDislikes),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              navigatePage(
                  context,
                  UsersListPage(
                    title: context.lwTranslate.menuMyDislikes,
                    pageBaseUrl: 'disliked',
                  ));
            },
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.heart),
            title: Text(context.lwTranslate.menuVisitors),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              navigatePage(
                  context,
                  UsersListPage(
                    title: context.lwTranslate.menuVisitors,
                    pageBaseUrl: 'visitors',
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.block),
            title: Text(context.lwTranslate.menuBlockedUsers),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              navigatePage(
                  context,
                  UsersListPage(
                    title: context.lwTranslate.menuBlockedUsers,
                    pageBaseUrl: 'blocked-users-list',
                  ));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.password),
            title: Text(context.lwTranslate.menuChangePassword),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              navigatePage(
                context,
                const ChangePasswordPage(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: Text(context.lwTranslate.menuChangeEmail),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              navigatePage(
                context,
                const ChangeEmailPage(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(context.lwTranslate.menuSettings),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              navigatePage(
                context,
                const UserSettingsPage(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(context.lwTranslate.menuLogout),
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
              data_transport.post(
                'user/logout',
              );
              auth.logout().then((response) {
                auth.redirectIfUnauthenticated(context);
              });
            },
          ),
        ],
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 25),
      child: Text(
        title,
        style: const TextStyle(fontSize: 30, color: app_theme.white),
      ),
    );
  }
}

class AppItemProgressIndicator extends StatelessWidget {
  final double? size;
  const AppItemProgressIndicator({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (size != null)
            ? Center(
                child: SizedBox(
                  height: size,
                  width: size,
                  child: const CircularProgressIndicator.adaptive(
                    strokeWidth: 1.5,
                  ),
                ),
              )
            : const CircularProgressIndicator.adaptive()
      ],
    );
  }
}

PreferredSizeWidget innerAppBar(
    {required String title, List<Widget>? actions}) {
  return AppBar(
    // backgroundColor: app_theme.topAndBottomBar,
    elevation: 0.0,
    title: Text(title),
    actions: actions,
  );
}

/// confirmation dialog
///
showActionableDialog(
  BuildContext context, {
  String? title,
  Widget? description,
  String? confirmActionText,
  String? cancelActionText,
  Function? onConfirm,
  VoidCallback? onCancel,
}) {
  title ??= context.lwTranslate.areYouSure;
  // show the dialog
  if (isIOSPlatform()) {
    CupertinoAlertDialog iosDialog = CupertinoAlertDialog(
      title: Text(title),
      content: description, //(description != null) ? Text(description) : null,
      actions: <Widget>[
        if (confirmActionText != null)
          CupertinoDialogAction(
            child: Text(
              confirmActionText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            onPressed: () {
              if (onConfirm != null) {
                if (onConfirm() != false) {
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).secondaryHeaderColor)),
            onPressed: () {
              Navigator.of(context).pop();
              if (onCancel != null) onCancel();
            },
          ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return iosDialog;
      },
    );
  } else {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: description, //(description != null) ? Text(description) : null,
      actions: [
        if (cancelActionText != null)
          TextButton(
            child: Text(cancelActionText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).secondaryHeaderColor)),
            onPressed: () {
              Navigator.of(context).pop(); // dismiss dialog
              if (onCancel != null) onCancel();
            },
          ),
        if (confirmActionText != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // dismiss dialog
              if (onConfirm != null) onConfirm();
            },
            child: Text(
              confirmActionText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height = 300,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const AppItemProgressIndicator(
        size: 20,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      height: height,
      width: width,
      // alignment: Alignment.center,
      fit: fit,
    );
  }
}

appCachedNetworkImageProvider({imageUrl}) {
  return CachedNetworkImageProvider(imageUrl);
}

AppBar mainAppBarWidget(
    {String? title,
    List<Widget>? actionWidgets,
    int notificationCount = 0,
    required BuildContext context}) {
  return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      toolbarOpacity: 0.6,
      /*   leading: Builder(builder: (context) {
              return IconButton(
                icon: Icon(CupertinoIcons.list_dash),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }), */
      // backgroundColor: app_theme.topAndBottomBar,
      elevation: 0,
      title: title != null
          ? Text(title)
          : Padding(
              padding: const EdgeInsets.only(
                bottom: 12,
              ),
              child: SizedBox(
                height: 45,
                width: 80,
                child: app_theme.logoImage,
              ),
            ),
      /*     title: Text(
              configItem('appTitle'),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
              ),
            ), */
      centerTitle: false,
      actions: actionWidgets ??
          <Widget>[
            IconButton(
              icon: const Icon(Icons.bolt),
              tooltip: 'Boost Profile',
              onPressed: () {
                navigatePage(context, const BoosterPage());
              },
            ),
            IconButton(
              icon: const Icon(Icons.wallet),
              tooltip: 'Credit Wallet',
              onPressed: () {
                navigatePage(context, const WalletTransactionListPage());
              },
            ),
            IconButton(
              icon: Container(
                margin: const EdgeInsets.only(right: 30),
                child: badges.Badge(
                  badgeAnimation: const badges.BadgeAnimation.fade(),
                  position: badges.BadgePosition.topEnd(end: -18),
                  badgeStyle: badges.BadgeStyle(
                      badgeColor: Theme.of(context).primaryColor),
                  showBadge: notificationCount > 0,
                  badgeContent: Text(notificationCount.toString()),
                  child: const Icon(CupertinoIcons.bell),
                ),
              ),
              tooltip: 'Show Snackbar',
              onPressed: () {
                navigatePage(context, const NotificationListPage());
              },
            ),
          ]);
}

class PremiumBadgeWidget extends StatelessWidget {
  const PremiumBadgeWidget({
    super.key,
    this.size = 48,
    this.preventTap = false,
  });
  final double size;
  final bool preventTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: preventTap
          ? null
          : () {
              navigatePage(context, const PremiumPage());
            },
      child: SizedBox(
        width: size,
        height: size,
        // ignore: prefer_const_constructors
        child: app_theme.premiumBadge,
      ),
    );
  }
}
