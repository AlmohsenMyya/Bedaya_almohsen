import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../screens/profile_update.dart';
import '../common/services/auth.dart';
import '../common/services/utils.dart';
import '../common/widgets/common.dart';
import '../common/services/data_transport.dart' as data_transport;
import 'messenger/messenger_chat_list.dart';
import 'profile_image_update.dart';
import 'user/abuse_report.dart';
import 'user_common.dart';
import 'package:latlong2/latlong.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key, this.userProfileItem = const {}});

  final Map userProfileItem;

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? countControllerValue;
  bool isOwnProfile = false;
  Map localUserProfileItem = {};
  bool isLiked = false;
  bool isDisliked = false;
  bool isLikeDislikeInitialized = false;
  String requestedUserUid = '';
  bool isUserBlocked = false;
  List giftListData = [];
  Map<String, dynamic>? data = {};
  Map userDetails = {};
  List photosData = [];
  List userGiftData = [];
  Map userProfileDetails = {};
  Map? userSpecificationData;
  double likeDislikeButtonSize = 0;
  String userUId = '';

  BannerAd? _bannerAd;
  bool _isLoaded = false;
  String _bannerAdUnitId = '';
  bool enableAds = true;

  void initiatePayment({
    required String value,
    required String credits,
    required BuildContext context,
  }) async {
    try {
      // طباعة بدء العملية
      print("Starting payment initialization...");

      // استدعاء واجهة الدفع
      await data_transport.post(
        'https://bedaya.com.tr/public/api/credit-wallet/order-credit',
        inputData: {
          'value': value,
          'credits': credits,
        },
        onFailed: (responseData) async {
          print("Response: $responseData");

          // استخراج الرابط من الرد
          final url = responseData!['url'];

          // تحقق من وجود الرابط
          if (url != null && url.isNotEmpty) {
            // عرض مربع حوار لتأكيد الدفع
            final shouldProceed = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('تأكيد الدفع'),
                  content:
                      const Text('سيتم نقلك إلى صفحة الدفع. هل تريد المتابعة؟'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('إلغاء'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('متابعة'),
                    ),
                  ],
                );
              },
            );

            // إذا وافق المستخدم
            if (shouldProceed == true) {
              // التحقق من إمكانية فتح الرابط
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              } else {
                // عرض Snackbar إذا تعذر فتح الرابط
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تعذر فتح الرابط')),
                );
              }
            }
          } else {
            // عرض Snackbar إذا لم يكن هناك رابط في الرد
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('فشل الحصول على الرابط من الخادم')),
            );
          }
        },
        onError: (error) {
          // معالجة الأخطاء
          print("Error: $error");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('حدث خطأ أثناء تنفيذ العملية')),
          );
        },
      );
    } catch (e) {
      // معالجة استثناءات غير متوقعة
      print("Exception: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('حدث خطأ غير متوقع')),
      );
    }
  }

  @override
  void initState() {
    if (mounted) {
      if (configItem('ads.profile_banner_ad.enable', fallbackValue: false) ==
          true) {
        _bannerAdUnitId = configItem(
            'ads.profile_banner_ad.${isIOSPlatform() ? 'ios' : 'android'}_ad_unit_id',
            fallbackValue: '');
      }
      if (widget.userProfileItem.isEmpty) {
        localUserProfileItem = {
          'fullName': getAuthInfo('full_name'),
          'username': getAuthInfo('username'),
          'profileImage': getAuthInfo('profile_picture_url'),
          'coverImage': getAuthInfo('cover_picture_url'),
        };
      } else {
        localUserProfileItem = widget.userProfileItem;
      }
      isOwnProfile =
          getAuthInfo('username') == localUserProfileItem["username"];
      refreshUserProfileData();
      isUserBlocked = localUserProfileItem['user_blocked'] ?? false;

      enableAds = (_bannerAdUnitId != '') &&
          (getAuthInfo(
                  'additional_user_info.features_availability.no_ads', false) !=
              true);
    }
    super.initState();
  }

  void refreshUserProfileData() {
    data_transport.get(
      'profile/${localUserProfileItem["username"]}/read-profile-details',
      onFailed: (responseData) {
        showErrorMessage(context, getItemValue(responseData, 'data.message'));
        Navigator.pop(context);
      },
      onSuccess: (responseData) {
        setState(() {
          data = responseData;
          if (kDebugMode) {
            print(
                "jnjknk.nkn ${data?['data']['completionPercentage']} ${data?['data']['matchingPercentage']} +++ ${data?['data']}");
          }
          isUserBlocked =
              data?['data']['isBlockUser'] || data?['data']['blockByMeUser'];
          userDetails = data?['data']['userData'];
          giftListData = data?['data']['giftListData'];
          photosData = data?['data']['photosData'];
          userGiftData = data?['data']['userGiftData'];
          userProfileDetails = (data?['data']['userProfileData'] is Map)
              ? (data?['data']['userProfileData'])
              : {};
          userSpecificationData = (data?['data']['specifications'] is Map)
              ? (data?['data']['specifications'])
              : {};
          likeDislikeButtonSize = 50;
          userUId = getItemValue(userDetails, "userUId");
          requestedUserUid = userUId;
        });
      },
    );
  }

  @override
  void dispose() {
    if (enableAds) {
      _bannerAd?.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _isLoaded = false;
    if (enableAds) {
      _loadBannerAd();
    }
  }

  /// on Like Dislike
  Future<bool> onLikeDislike(bool isThisLiked, String userUId,
      {int likeType = 1}) async {
    setState(
      () {
        // if like button clicked
        if (likeType == 1) {
          // if already liked then it should be remove like
          if (isLiked) {
            isLiked = false;
          } else {
            // else like user
            isLiked = true;
          }
          isDisliked = false;
        } else {
          // if dislike button clicked
          // if already disliked
          if (isDisliked) {
            // remove as dislike
            isDisliked = false;
          } else {
            // mark as dislike
            isDisliked = true;
          }
          isLiked = false;
        }
      },
    );
    data_transport.post('$userUId/$likeType/user-like-dislike');
    return !isThisLiked;
  }

  /// Loads and shows a banner ad.
  ///
  /// Dimensions of the ad are determined by the width of the screen.
  void _loadBannerAd() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      // Unable to get width of anchored banner.
      return;
    }

    BannerAd(
      adUnitId: _bannerAdUnitId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: Visibility(
        visible: isOwnProfile,
        child: FloatingActionButton(
          mini: true,
          heroTag: 'myProfileUpdate',
          child: const Icon(Icons.edit),
          onPressed: () {
            navigatePage(context, const ProfileUpdatePage());
          },
        ),
      ),
      appBar: AppBar(
        toolbarHeight: isOwnProfile ? 0 : null,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: (isUserBlocked || data!.isEmpty)
            ? []
            : <Widget>[
                IconButton(
                  icon: const Icon(CupertinoIcons.bubble_right),
                  tooltip: 'Comment',
                  onPressed: () {
                    return navigatePage(
                      context,
                      !userInfo['is_premium']
                          ? BePremiumAlertInfo()
                          : MessengerChatListPage(
                              sourceElement: {
                                'user_full_name':
                                    localUserProfileItem['fullName'] ??
                                        localUserProfileItem['userFullName'],
                                'username': localUserProfileItem['username'],
                                'profile_picture':
                                    localUserProfileItem['profileImage'] ??
                                        localUserProfileItem['userImageUrl'],
                                'cover_photo':
                                    localUserProfileItem['coverImage'] ??
                                        localUserProfileItem['userCoverUrl'],
                                'user_id': localUserProfileItem['id'] ??
                                    localUserProfileItem['_id'] ??
                                    localUserProfileItem['user_id'],
                              },
                            ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.gift),
                  tooltip: context.lwTranslate.gift,
                  onPressed: () {
                    showModalBottomSheet<void>(
                      // context and builder are
                      // required properties in this widget
                      context: context,
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            automaticallyImplyLeading: false,
                            centerTitle: false,
                            title: Text(context.lwTranslate.sendAGift),
                          ),
                          body: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                                itemCount: giftListData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Map giftData = giftListData[index];
                                  return GestureDetector(
                                    onTap: () {
                                      bool? sendPrivately = false;
                                      String localUserProfileItemName =
                                          localUserProfileItem['fullName'] ??
                                              localUserProfileItem[
                                                  'userFullName'];
                                      showActionableDialog(
                                        context,
                                        title: context.lwTranslate
                                            .sendGiftToLocalUserProfileItemName(
                                                localUserProfileItemName),
                                        description: StatefulBuilder(builder:
                                            (BuildContext context,
                                                StateSetter setState) {
                                          return CheckboxListTile(
                                            onChanged: (bool? value) {
                                              setState(() {
                                                sendPrivately = (value == true);
                                              });
                                            },
                                            title: Text(
                                                context.lwTranslate.privately),
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                            value: sendPrivately,
                                            selected: (sendPrivately != true)
                                                ? false
                                                : true,
                                          );
                                        }),
                                        onConfirm: () {
                                          data_transport.post(
                                            '$requestedUserUid/send-gift',
                                            context: context,
                                            inputData: {
                                              'isPrivateGift': sendPrivately,
                                              'selected_gift': giftData['_uid']
                                            },
                                            onSuccess: (responseData) {
                                              setState(() {
                                                userGiftData.add({
                                                  'userGiftImgUrl': giftData[
                                                      'gift_image_url'],
                                                  'fromUserName':
                                                      localUserProfileItem[
                                                              'fullName'] ??
                                                          localUserProfileItem[
                                                              'userFullName'],
                                                  'isPrivate': sendPrivately
                                                });
                                              });
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                        confirmActionText:
                                            context.lwTranslate.send,
                                        cancelActionText:
                                            context.lwTranslate.cancel,
                                      );
                                    },
                                    child: Card(
                                      // color: Colors.amber,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: AppCachedNetworkImage(
                                                imageUrl:
                                                    giftData['gift_image_url'],
                                                height: 80,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            giftData['formattedPrice'],
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.exclamationmark_octagon),
                  tooltip: context.lwTranslate.reportAbuse,
                  onPressed: () {
                    navigatePage(
                        context,
                        AbuseReportPage(
                          userFullName: localUserProfileItem['fullName'] ??
                              localUserProfileItem['userFullName'],
                          userUid: requestedUserUid,
                        ));
                  },
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.clear_circled),
                  tooltip: context.lwTranslate.block,
                  onPressed: () {
                    setState(() {
                      isUserBlocked = true;
                    });
                    data_transport.post(
                      'block-user',
                      inputData: {
                        'block_user_id': requestedUserUid,
                      },
                      context: context,
                    );
                  },
                ),
              ],
        //<Wi
        title: Text(
          localUserProfileItem["fullName"] ??
              localUserProfileItem['userFullName'],
          // style: const TextStyle(color: app_theme.white, fontSize: 24),
        ),
        // centerTitle: true,
        elevation: 0,
      ),
      // backgroundColor: app_theme.white,
      body: isUserBlocked
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Icon(
                      Icons.block,
                      size: 64,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    context.lwTranslate.userBlocked,
                    style: const TextStyle(fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      child: Text(
                        context.lwTranslate.unblock,
                      ),
                      onPressed: () {
                        setState(() {
                          isUserBlocked = false;
                        });
                        data_transport.post(
                            '$requestedUserUid/unblock-user-data',
                            context: context);
                      },
                    ),
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              // GestureDetector(
                              //   onTap: () => navigatePage(
                              //     context,
                              //     ProfileImageView(
                              //       title: Text(localUserProfileItem[
                              //               "fullName"] ??
                              //           localUserProfileItem["userFullName"]),
                              //       imageUrl: localUserProfileItem[
                              //               'coverImage'] ??
                              //           localUserProfileItem['userCoverUrl'],
                              //       actions: !isOwnProfile
                              //           ? []
                              //           : [
                              //               IconButton(
                              //                   icon: const Icon(Icons.edit),
                              //                   tooltip: context.lwTranslate
                              //                       .uploadNewPhotos,
                              //                   onPressed: () {
                              //                     navigatePage(
                              //                       context,
                              //                       const ProfileImageUpdatePage(),
                              //                     );
                              //                   }),
                              //             ],
                              //     ),
                              //   ),
                              //   child: Hero(
                              //     tag: 'mainImage',
                              //     transitionOnUserGestures: true,
                              //     child: ClipRRect(
                              //       borderRadius: BorderRadius.circular(4),
                              //       child: AppCachedNetworkImage(
                              //         imageUrl: localUserProfileItem[
                              //                 'coverImage'] ??
                              //             localUserProfileItem['userCoverUrl'],
                              //         height: 150,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () => navigatePage(
                                    context,
                                    ProfileImageView(
                                      title: Text(localUserProfileItem[
                                              "fullName"] ??
                                          localUserProfileItem["userFullName"]),
                                      imageUrl: localUserProfileItem[
                                              'profileImage'] ??
                                          localUserProfileItem['userImageUrl'],
                                      actions: !isOwnProfile
                                          ? []
                                          : [
                                              IconButton(
                                                  icon: const Icon(Icons.edit),
                                                  tooltip: context.lwTranslate
                                                      .uploadNewPhotos,
                                                  onPressed: () {
                                                    navigatePage(
                                                      context,
                                                      const ProfileImageUpdatePage(),
                                                    );
                                                  }),
                                            ],
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 80,
                                    // child: const Text('AH'),
                                    backgroundImage:
                                        appCachedNetworkImageProvider(
                                      imageUrl: localUserProfileItem[
                                              'profileImage'] ??
                                          localUserProfileItem['userImageUrl'],
                                      // width: double.infinity,
                                      // height: 300,
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              if ((localUserProfileItem['isPremiumUser'] !=
                                      null) &&
                                  localUserProfileItem['isPremiumUser'] == true)
                                const Positioned(
                                  top: 10,
                                  right: 10,
                                  child: PremiumBadgeWidget(),
                                ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  // ignore: prefer_const_constructors
                                  decoration: BoxDecoration(
                                    color: ((localUserProfileItem[
                                                'userOnlineStatus'] ==
                                            1)
                                        ? Colors.green
                                        : (localUserProfileItem[
                                                    'userOnlineStatus'] ==
                                                2
                                            ? Colors.orange
                                            : Colors.red)),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Builder(
                            // future: _fetchMyData,
                            builder: (BuildContext context) {
                          List<Widget> children = <Widget>[];
                          if (data!.isNotEmpty) {
                            if (!isOwnProfile) {
                              if (!isLikeDislikeInitialized) {
                                isLiked = getItemValue(
                                            data, 'data.userLikeData.like') ==
                                        1
                                    ? true
                                    : false;
                                isDisliked = !isLiked;
                                if (getItemValue(
                                        data, 'data.userLikeData.like') ==
                                    null) {
                                  isDisliked = false;
                                }
                                isLikeDislikeInitialized = true;
                              }
                            }

                            children.addAll([
                              if (isOwnProfile)
                                ProfileCompletionBar(
                                  completionPercentage: double.tryParse(
                                      getItemValue(
                                              data, 'data.completionPercentage')
                                          .toString())!, // ضع النسبة هنا (0-100)
                                  // حجم الدائرة
                                ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: IconButton(
                                    onPressed: () {
                                      initiatePayment(
                                        value: "10",
                                        credits: "100",
                                        context: context,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.paypal_outlined,
                                      color: Colors.blue,
                                    )),
                              ),
                              if (!isOwnProfile)
                                ProfileMatchingCircle(
                                  completionPercentage: double.tryParse(
                                      getItemValue(
                                              data, 'data.matchingPercentage')
                                          .toString())!,
                                  size: 40, // ضع النسبة هنا (0-100)
                                  // حجم الدائرة
                                ),
                              if (isOwnProfile)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        color: Colors.red,
                                        CupertinoIcons.heart_fill,
                                        semanticLabel:
                                            context.lwTranslate.totalLikes,
                                      ),
                                    ),
                                    Text(
                                      getItemValue(data, 'data.totalUserLike')
                                          .toString(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25, right: 10),
                                      child: Icon(
                                        color: Colors.green,
                                        Icons.visibility,
                                        semanticLabel:
                                            context.lwTranslate.totalViews,
                                      ),
                                    ),
                                    Text(
                                      getItemValue(data, 'data.totalVisitors')
                                          .toString(),
                                    ),
                                  ],
                                ),
                              if (!isOwnProfile)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LikeButton(
                                      isLiked: isLiked,
                                      size: likeDislikeButtonSize,
                                      onTap: (isThisLiked) async {
                                        return onLikeDislike(
                                            isThisLiked, userUId,
                                            likeType: 1);
                                      },
                                      likeBuilder: (bool isThisLiked) {
                                        return isLiked
                                            ? Icon(
                                                CupertinoIcons
                                                    .heart_circle_fill,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: likeDislikeButtonSize,
                                              )
                                            : Icon(
                                                CupertinoIcons
                                                    .heart_circle_fill,
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor,
                                                size: likeDislikeButtonSize,
                                              );
                                      },
                                      // likeCount: 665,
                                    ),
                                    LikeButton(
                                      isLiked: isDisliked,
                                      size: likeDislikeButtonSize,
                                      onTap: (isThisLiked) async {
                                        return onLikeDislike(
                                            isThisLiked, userUId,
                                            likeType: 0);
                                      },
                                      likeBuilder: (bool isThisLiked) {
                                        return isDisliked
                                            ? Icon(
                                                CupertinoIcons
                                                    .heart_slash_circle_fill,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: likeDislikeButtonSize,
                                              )
                                            : Icon(
                                                CupertinoIcons
                                                    .heart_slash_circle_fill,
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor,
                                                size: likeDislikeButtonSize,
                                              );
                                      },
                                    ),
                                  ],
                                ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${userDetails['fullName']}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(" (${userDetails['userAge']}) "),
                                    if (getItemValue(
                                            userProfileDetails, 'isVerified') ==
                                        1)
                                      const Icon(
                                        Icons.verified,
                                        color: Colors.greenAccent,
                                      )
                                  ],
                                ),
                              ),
                              if ((userProfileDetails['city'] != null) ||
                                  (userProfileDetails['country_name'] != ''))
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Icon(
                                        Icons.location_pin,
                                        size: 16,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        "${userProfileDetails['city'] ?? ''}${userProfileDetails['country_name'] != '' ? ',' : ''} ${userProfileDetails['country_name'] ?? ''}",
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              const Divider(
                                thickness: 0.1,
                                height: 50,
                              ),
                              InfoItemWidget(
                                label: context.lwTranslate.aboutMe,
                                value: userProfileDetails['aboutMe'],
                              ),
                              InfoItemWidget(
                                label: context.lwTranslate.gender,
                                value: userProfileDetails['gender_text'],
                              ),
                              InfoItemWidget(
                                label: context.lwTranslate.preferredLanguage,
                                value: userProfileDetails[
                                    'formatted_preferred_language'],
                              ),
                              InfoItemWidget(
                                label: context.lwTranslate.relationshipStatus,
                                value: userProfileDetails[
                                    'formatted_relationship_status'],
                              ),
                              InfoItemWidget(
                                label: context.lwTranslate.workStatus,
                                value:
                                    userProfileDetails['formatted_work_status'],
                              ),
                              InfoItemWidget(
                                label: context.lwTranslate.education,
                                value:
                                    userProfileDetails['formatted_education'],
                              ),
                              InfoItemWidget(
                                label: context.lwTranslate.birthday,
                                value: userProfileDetails['birthday'],
                              ),
                              InfoItemWidget(
                                label: context.lwTranslate.mobileNumber,
                                value: userProfileDetails['mobile_number'],
                              ),
                              if (userProfileDetails['city'] != null &&
                                  ((userProfileDetails['city'] != null) &&
                                      (userProfileDetails['country_name'] !=
                                          'null')))
                                InfoItemWidget(
                                    label: context.lwTranslate.location,
                                    value:
                                        "${userProfileDetails['city']}, ${userProfileDetails['country_name']}"),
                              if ((getItemValue(
                                          userProfileDetails, 'latitude') !=
                                      null) &&
                                  getItemValue(
                                          userProfileDetails, 'longitude') !=
                                      null)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 300,
                                    child: FlutterMap(
                                      options: MapOptions(
                                        initialCenter: LatLng(
                                          (getItemValue(userProfileDetails,
                                                  'latitude') as num)
                                              .toDouble(),
                                          (getItemValue(userProfileDetails,
                                                  'longitude') as num)
                                              .toDouble(),
                                        ),
                                        initialZoom: 13,
                                      ),
                                      /*   nonRotatedChildren: [
                                  AttributionWidget.defaultWidget(
                                    source: 'OpenStreetMap contributors',
                                    onSourceTapped: null,
                                  ),
                                ], */
                                      children: [
                                        TileLayer(
                                          urlTemplate:
                                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                          // userAgentPackageName: 'com.example.app',
                                        ),
                                        MarkerLayer(markers: [
                                          Marker(
                                            // width: 80,
                                            // height: 80,
                                            point: LatLng(
                                              (userProfileDetails['latitude']
                                                      as num)
                                                  .toDouble(),
                                              (userProfileDetails['longitude']
                                                      as num)
                                                  .toDouble(),
                                            ),
                                            child: const Icon(
                                              Icons.location_pin,
                                              color: Colors.red,
                                              size: 40,
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                ),
                            ]);

                            if (userSpecificationData != null) {
                              userSpecificationData?.forEach(
                                  (specificationItemIndex, specificationItem) {
                                List<InfoItemWidget> specificationValueOption =
                                    [];
                                List itemOptions = data?['data']
                                        ['specifications']
                                    [specificationItemIndex]['items'];
                                for (var item in itemOptions) {
                                  if (item['value'] == '') {
                                    continue;
                                  }
                                  specificationValueOption.add(
                                    InfoItemWidget(
                                      label: item['label'],
                                      value: item['value'],
                                    ),
                                  );
                                }
                                if (specificationValueOption.isNotEmpty) {
                                  children.add(Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Text(
                                        specificationItem['title'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ));
                                  children.addAll(specificationValueOption);
                                }
                              });
                            }
                            List<Widget> photosItems = [];
                            if (photosData.isNotEmpty) {
                              for (var element in photosData) {
                                photosItems.add(OpenContainer<bool>(
                                  openColor:
                                      Theme.of(context).colorScheme.surface,
                                  closedColor:
                                      Theme.of(context).colorScheme.surface,
                                  transitionType: ContainerTransitionType.fade,
                                  openBuilder: (BuildContext _,
                                      Function? openContainer) {
                                    return ProfileImageView(
                                      imageUrl: element['image_url'],
                                    );
                                  },
                                  closedShape: const RoundedRectangleBorder(),
                                  closedElevation: 0.0,
                                  closedBuilder: (BuildContext _,
                                      Function? openContainer) {
                                    return Card(
                                      // padding: const EdgeInsets.all(8.0),
                                      child: AppCachedNetworkImage(
                                        imageUrl: element['image_url'],
                                        fit: BoxFit.cover,
                                        height: 180,
                                      ),
                                    );
                                  },
                                ));
                              }
                              if (photosItems.isNotEmpty) {
                                children.add(
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 28),
                                    child: Text(
                                      'Photos',
                                      style: TextStyle(
                                        fontSize: 28,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              children.add(Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 16),
                                child: GridView(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        MediaQuery.of(context).size.width ~/
                                            180,
                                  ),
                                  children: photosItems,
                                ),
                              ));
                            }

                            List<Widget> giftItems = [];
                            if (userGiftData.isNotEmpty) {
                              for (var element in userGiftData) {
                                giftItems.add(OpenContainer<bool>(
                                  openColor:
                                      Theme.of(context).colorScheme.surface,
                                  closedColor:
                                      Theme.of(context).colorScheme.surface,
                                  transitionType: ContainerTransitionType.fade,
                                  openBuilder: (BuildContext _,
                                      Function? openContainer) {
                                    return ProfileImageView(
                                      imageUrl: element['userGiftImgUrl'],
                                      title: Text(
                                        'From ${element['fromUserName']}',
                                      ),
                                    );
                                  },
                                  closedShape: const RoundedRectangleBorder(),
                                  closedElevation: 0.0,
                                  closedBuilder: (BuildContext _,
                                      Function? openContainer) {
                                    return Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: AppCachedNetworkImage(
                                                imageUrl:
                                                    element['userGiftImgUrl'],
                                                fit: BoxFit.contain,
                                                height: 180,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                'from \n ${element['fromUserName']}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Icon(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              Icons.wallet_giftcard,
                                            ),
                                            if (element['isPrivate'])
                                              const Positioned(
                                                right: 0,
                                                child: Icon(
                                                  size: 16,
                                                  // color: Theme.of(context)
                                                  // .primaryColor,
                                                  Icons.lock,
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ));
                              }

                              if (giftItems.isNotEmpty) {
                                children.add(
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 28),
                                    child: Text(
                                      'Gifts',
                                      style: TextStyle(
                                        fontSize: 28,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              children.add(Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 16),
                                child: GridView(
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          MediaQuery.of(context).size.width ~/
                                              180,
                                    ),
                                    children: giftItems),
                              ));
                            }

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: children,
                              ),
                            );
                          } else {
                            return const Align(
                              alignment: Alignment.center,
                              child: AppItemProgressIndicator(),
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                ),
                if (_bannerAd != null && _isLoaded && !isOwnProfile)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(
                      child: SizedBox(
                        width: _bannerAd!.size.width.toDouble(),
                        height: _bannerAd!.size.height.toDouble(),
                        child: AdWidget(ad: _bannerAd!),
                      ),
                    ),
                  )
              ],
            ),
    );
  }
}

class ProfileCompletionBar extends StatelessWidget {
  final double completionPercentage; // نسبة اكتمال البروفايل (0-100)

  const ProfileCompletionBar({
    Key? key,
    required this.completionPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          // شريط النسبة
          Expanded(
            child: Stack(
              children: [
                // الخلفية البيضاء للشريط
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                // شريط الاكتمال باللون الأحمر
                FractionallySizedBox(
                  widthFactor: completionPercentage / 100,
                  // تحديد عرض الشريط حسب النسبة
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // عرض النسبة المئوية بجانب الشريط
          SizedBox(width: 8),
          Text(
            '${completionPercentage.toInt()}%', // عرض النسبة المئوية
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMatchingCircle extends StatelessWidget {
  final double completionPercentage; // نسبة اكتمال البروفايل (0-100)
  final double size; // حجم الدائرة
  final bool? noPadding;

  const ProfileMatchingCircle(
      {Key? key,
      required this.completionPercentage,
      required this.size,
      this.noPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: noPadding != null ? EdgeInsets.all(0.0) : EdgeInsets.all(25.0),
      child: GestureDetector(
        onTap: () {
          // عند النقر على الدائرة، نعرض مربع الحوار
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // الدائرة الخارجية كنسبة الاكتمال
                          SizedBox(
                            height: size,
                            width: size,
                            child: CircularProgressIndicator(
                              value: completionPercentage / 100,
                              strokeWidth: size * 0.1,
                              // حجم الخط يتناسب مع حجم الدائرة
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 198, 29, 97)),
                            ),
                          ),
                          // النسبة المئوية في منتصف الدائرة
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${completionPercentage.toInt()}',
                                style: TextStyle(
                                  fontSize: size * 0.25,
                                  // حجم الخط يتناسب مع حجم الدائرة
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                  fontSize: size * 0.15,
                                  // حجم الخط يتناسب مع حجم الدائرة
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'This is your match percentage with this profile.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // الدائرة الخارجية كنسبة الاكتمال
                SizedBox(
                  height: size,
                  width: size,
                  child: Container(
                    child: CircularProgressIndicator(
                      value: completionPercentage / 100,
                      strokeWidth: size * 0.1, // حجم الخط يتناسب مع حجم الدائرة
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 198, 29, 97)),
                    ),
                  ),
                ),
                // النسبة المئوية في منتصف الدائرة
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${completionPercentage.toInt()}',
                      style: TextStyle(
                        fontSize: size * 0.25, // حجم الخط يتناسب مع حجم الدائرة
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 198, 29, 97),
                      ),
                    ),
                    Text(
                      '%',
                      style: TextStyle(
                        fontSize: size * 0.20, // حجم الخط يتناسب مع حجم الدائرة
                        color: Color.fromARGB(255, 198, 29, 97),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
