import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_card_swiper/models/photo_card.dart';
import 'package:photo_card_swiper/photo_card_swiper.dart';
import '../common/services/auth.dart';
import '../common/services/data_transport.dart' as data_transport;
import '../common/services/utils.dart';
import '../common/widgets/common.dart';
import 'messenger/messenger_chat_list.dart';
import 'profile_details.dart';
import 'user_common.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EncounterPage extends StatefulWidget {
  const EncounterPage({super.key});

  @override
  EncounterPageState createState() => EncounterPageState();
}

class EncounterPageState extends State<EncounterPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PhotoCard? encounterCard;
  Map encounteredUserData = {};
  bool isLoaded = false;
  bool isSkiped = false;
  bool encounterAvailability = false;
  List<PhotoCard> encounterCards = [];
  List<Map> previousProfiles = []; // Stack to store previous profiles
  var userQueue = []; // قائمة الانتظار
  int maxQueueSize = 5; // الحد الأقصى لعدد المستخدمين في القائمة
  void fetchEncounterQueue() async {
    if (userQueue.length < maxQueueSize) {
      data_transport.get(
        'encounter-data',
        context: context,
        onSuccess: (responseData) {
          var usersData = getItemValue(responseData, 'data.randomUserData',
              fallbackValue: {});
          setState(() {
            if (usersData is List && usersData.isNotEmpty) {
              // إذا كانت البيانات قائمة، أضفها إلى قائمة الانتظار
              userQueue.addAll(usersData
                  .where((user) => user is Map)
                  .cast<Map<dynamic, dynamic>>());
            } else if (usersData is Map && usersData.isNotEmpty) {
              // إذا كانت البيانات عنصرًا مفردًا، أضفه إلى قائمة الانتظار
              userQueue.add(usersData);
            }

            // استدعاء الوظيفة مجددًا إذا لم يصل طول القائمة إلى maxQueueSize
            if (userQueue.length < maxQueueSize) {
              fetchEncounterQueue();
            }
          });
        },
      );
    }
  }

  void loadNextUser() {
    if (userQueue.isNotEmpty) {

      setState(() {
        isSkiped = true;
        if (encounteredUserData.isNotEmpty) {
          previousProfiles
              .add(encounteredUserData); // Add current profile to stack
        }
        encounteredUserData = userQueue.removeLast(); // استرجاع المستخدم الأول


        encounterCards = [
          PhotoCard(
            cardId: encounteredUserData['_uid'],
            description: Column(
              children: [
                Text(
                  encounteredUserData['userFullName'],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Divider(
                  height: 10,
                ),
                Text(encounteredUserData['detailString'] ?? ''),
                Text(encounteredUserData['countryName'] ?? ''),
              ],
            ),
            itemWidget: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                // Container(color: Colors.red,),
                AppCachedNetworkImage(
                  height: double.infinity,
                  imageUrl: encounteredUserData['userImageUrl'],
                  // imageUrl: encounteredUserData['userCoverUrl'],
                ),
                // Positioned(
                //   bottom: 10,
                //   child: CircleAvatar(
                //     radius: 80,
                //     backgroundImage: appCachedNetworkImageProvider(
                //       imageUrl: encounteredUserData['userImageUrl'],
                //     ),
                //   ),
                // ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 60, // حجم الخلفية أكبر قليلاً من الدائرة
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black38.withOpacity(0.5), // لون أبيض شفاف
                      ),
                    )),
                Positioned(
                  top: 10,
                  right: 10,
                  child: ProfileMatchingCircle(
                    completionPercentage: double.tryParse(
                        encounteredUserData['matchingPercentage'].toString())!,
                    size: 60, // ضع النسبة هنا (0-100)
                    noPadding: true,
                    // حجم الدائرة
                  ),
                ),
                if ((encounteredUserData['isPremiumUser'] != null) &&
                    encounteredUserData['isPremiumUser'])
                  const Positioned(
                    bottom: 10,//55555
                    right: 10,
                    child: PremiumBadgeWidget(),
                  ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: ((encounteredUserData['userOnlineStatus'] == 1)
                          ? Colors.green
                          : (encounteredUserData['userOnlineStatus'] == 2
                              ? Colors.orange
                              : Colors.red)),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            isLocalImage: false,
          ),
        ];
      });

      // تحميل المزيد من البيانات إذا اقتربت قائمة الانتظار من النفاد
      if (userQueue.length < maxQueueSize ~/ 2) {
        fetchEncounterQueue();
      }
    } else {
      // إذا لم يكن هناك بيانات، قم بتحميل المزيد
      fetchEncounterQueue();
    }
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchEncounterQueue(); // تحميل قائمة الانتظار
      getEncounterData(); // تحميل البيانات الحالية
    }
  }

  /// Get initial encounter data
  getEncounterData() {
    data_transport.get(
      'encounter-data',
      context: context,
      onSuccess: (responseData) {
        setState(() {
          isLoaded = true;
          isSkiped = true;
          encounterAvailability =
              getItemValue(responseData, 'data.encounterAvailability');

          var tempEncounteredUserData = getItemValue(
            responseData,
            'data.randomUserData',
            fallbackValue: {},
          );
          if (tempEncounteredUserData is List) {
            encounteredUserData = {};
          } else {
            if (encounteredUserData.isNotEmpty) {
              previousProfiles
                  .add(encounteredUserData); // Add current profile to stack
            }
            encounteredUserData = tempEncounteredUserData;
          }

          if (encounteredUserData.isNotEmpty) {
            encounterCards = [
              PhotoCard(
                cardId: encounteredUserData['_uid'],
                description: Column(
                  children: [
                    Text(
                      encounteredUserData['userFullName'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Divider(
                      height: 10,
                    ),
                    Text(encounteredUserData['detailString'] ?? ''),
                    Text(encounteredUserData['countryName'] ?? ''),
                  ],
                ),
                itemWidget: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    AppCachedNetworkImage(
                      height: double.infinity,
                      imageUrl: encounteredUserData['userImageUrl'],
                      // imageUrl: encounteredUserData['userCoverUrl'],
                    ),
                    // Positioned(
                    //   bottom: 10,
                    //   child: CircleAvatar(
                    //     radius: 80,
                    //     backgroundImage: appCachedNetworkImageProvider(
                    //       imageUrl: encounteredUserData['userImageUrl'],
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          width: 60, // حجم الخلفية أكبر قليلاً من الدائرة
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black38
                                .withOpacity(0.5), // لون أبيض شفاف
                          ),
                        )),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: ProfileMatchingCircle(
                        completionPercentage: double.tryParse(
                            encounteredUserData['matchingPercentage']
                                .toString())!,
                        size: 60, // ضع النسبة هنا (0-100)
                        noPadding: true,
                        // حجم الدائرة
                      ),
                    ),
                    if ((encounteredUserData['isPremiumUser'] != null) &&
                        encounteredUserData['isPremiumUser'])
                      const Positioned(
                        bottom: 10,//55555
                        right: 10,
                        child: PremiumBadgeWidget(),
                      ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: ((encounteredUserData['userOnlineStatus'] == 1)
                              ? Colors.green
                              : (encounteredUserData['userOnlineStatus'] == 2
                                  ? Colors.orange
                                  : Colors.red)),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                isLocalImage: false,
              ),
            ];
          }
        });
      },
    );
  }

  void navigateToPreviousProfile() {
    if (previousProfiles.isNotEmpty) {
      setState(() {
        encounteredUserData =
            previousProfiles.removeLast(); // Restore last profile
        encounterCards = [
          PhotoCard(
            cardId: encounteredUserData['_uid'],
            description: Column(
              children: [
                Text(
                  encounteredUserData['userFullName'],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Divider(
                  height: 10,
                ),
                Text(encounteredUserData['detailString'] ?? ''),
                Text(encounteredUserData['countryName'] ?? ''),
              ],
            ),
            itemWidget: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                AppCachedNetworkImage(
                  height: double.infinity,
                  imageUrl: encounteredUserData['userImageUrl'],
                  // imageUrl: encounteredUserData['userCoverUrl'],
                ),
                // Positioned(
                //   bottom: 10,
                //   child: CircleAvatar(
                //     radius: 80,
                //     backgroundImage: appCachedNetworkImageProvider(
                //       imageUrl: encounteredUserData['userImageUrl'],
                //     ),
                //   ),
                // ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 60, // حجم الخلفية أكبر قليلاً من الدائرة
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black38.withOpacity(0.5), // لون أبيض شفاف
                      ),
                    )),
                Positioned(
                  top: 10,
                  right: 10,
                  child: ProfileMatchingCircle(
                    completionPercentage: double.tryParse(
                        encounteredUserData['matchingPercentage'].toString())!,
                    size: 60, // ضع النسبة هنا (0-100)
                    noPadding: true,
                    // حجم الدائرة
                  ),
                ),
                if ((encounteredUserData['isPremiumUser'] != null) &&
                    encounteredUserData['isPremiumUser'])
                  const Positioned(
                    bottom: 10,//55555
                    right: 10,
                    child: PremiumBadgeWidget(),
                  ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: ((encounteredUserData['userOnlineStatus'] == 1)
                          ? Colors.green
                          : (encounteredUserData['userOnlineStatus'] == 2
                              ? Colors.orange
                              : Colors.red)),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            isLocalImage: false,
          ),
        ];
      });
    }
  }

  void stattty() {
    setState(() {
      isSkiped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: !isLoaded
          ? const Center(child: AppItemProgressIndicator())
          : encounterAvailability == false
              ? const BePremiumAlertInfo()
              : (encounteredUserData.isNotEmpty
                  ? Stack(
                      children: [
                        SizedBox.expand(
                          child: PhotoCardSwiper(
                            farRightWidget: ClipOval(
                              child: Material(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.grey[200] ?? Colors.grey,
                                      width: 3,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                color: Colors.black,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  child:  SizedBox(
                                      width: 37,
                                      height: 37,
                                      child: Container(
                                        color: Colors.white,
                                        child: Icon(
                                          CupertinoIcons.heart_fill,
                                          color: Theme.of(context).primaryColor,
                                          size: 28,
                                        ),
                                      )),
                                  onTap: () {
                                    loadNextUser();
                                    data_transport.post(
                                        "encounters/${encounteredUserData['_uid']}/skip-encounter-user",
                                        context: context,
                                        onSuccess: (responseData) {
                                      // loadNextUser(); // تحميل المستخدم التالي
                                    });
                                  },
                                ),
                              ),
                            ),

                            farLeftButtonIconColor: Theme.of(context).primaryColor,
                            farLeftButtonBackgroundColor: Colors.white,
                            farRightButtonIcon: Icons.lan_rounded,
                            farLeftButtonAction: () {
                              loadNextUser();
                              data_transport.post(
                                  "encounters/${encounteredUserData['_uid']}/2/user-encounter-like-dislike",
                                  context: context, onSuccess: (responseData) {
                                // loadNextUser(); // تحميل المستخدم التالي
                              });
                            },
                            farRightButtonAction: () {
                              loadNextUser();
                              data_transport.post(
                                  "encounters/${encounteredUserData['_uid']}/1/user-encounter-like-dislike",
                                  context: context, onSuccess: (responseData) {
                                // loadNextUser(); // تحميل المستخدم التالي
                              });
                            },
                            cardBgColor: const Color.fromARGB(100, 0, 0, 0),
                            photos: encounterCards,
                            showLoading: true,
                            hideCenterButton: false,
                            leftButtonIcon:
                            CupertinoIcons.chevron_left_circle_fill,
                            rightButtonIcon: CupertinoIcons.chevron_right_circle_fill,
                            centerButtonIcon: Icons.telegram,
                            onCardTap: (params) {
                              navigatePage(
                                  context,
                                  ProfileDetailsPage(
                                    userProfileItem: {
                                      'fullName':
                                          encounteredUserData['userFullName'],
                                      'profileImage':
                                          encounteredUserData['userImageUrl'],
                                      'coverImage':
                                          encounteredUserData['userCoverUrl'],
                                      'id': encounteredUserData['_id'],
                                      'username':
                                          encounteredUserData['username'],
                                    },
                                  ));
                            },
                            cardSwiped:
                                (CardActionDirection direction, int index) {
                              if (direction ==
                                  CardActionDirection.cardCenterAction) {
                                !userInfo['is_premium']
                                    ? showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                              color: Colors.black,
                                              child: BePremiumAlertInfo());
                                        },
                                      )
                                    : navigatePage(
                                        context,
                                        MessengerChatListPage(
                                          sourceElement: {
                                            'user_full_name':
                                                encounteredUserData[
                                                        'fullName'] ??
                                                    encounteredUserData[
                                                        'userFullName'],
                                            'username':
                                                encounteredUserData['username'],
                                            'profile_picture':
                                                encounteredUserData[
                                                        'profileImage'] ??
                                                    encounteredUserData[
                                                        'userImageUrl'],
                                            'cover_photo': encounteredUserData[
                                                    'coverImage'] ??
                                                encounteredUserData[
                                                    'userCoverUrl'],
                                            'user_id': encounteredUserData[
                                                    'id'] ??
                                                encounteredUserData['_id'] ??
                                                encounteredUserData['user_id'],
                                          },
                                        ),
                                      );
                                setState(() {});
                              }
                            },
                            rightButtonAction: () {
                              loadNextUser();
                              data_transport.post(
                                  "encounters/${encounteredUserData['_uid']}/skip-encounter-user",
                                  context: context,
                                  onSuccess: (responseData) {
                                    // loadNextUser(); // تحميل المستخدم التالي
                                  });

                            },
                            leftButtonAction: () {
                              if (previousProfiles.isNotEmpty && isSkiped) {
                                navigateToPreviousProfile();
                              }
                            },
                          ),
                        ),
                        //
                        // Positioned(
                        //   bottom: 27.5.h,
                        //   right: 80.5.w,
                        //   child: previousProfiles.isNotEmpty && isSkiped
                        //       ? IconButton(
                        //           onPressed: () {
                        //             navigateToPreviousProfile();
                        //           },
                        //           icon: Container(
                        //             decoration: BoxDecoration(
                        //               shape: BoxShape.circle,
                        //               color: Colors.blue.shade50,
                        //               border: Border.all(
                        //                   color: Colors.white, width: 3),
                        //             ),
                        //             padding: const EdgeInsets.all(8),
                        //             child: Icon(Icons.chevron_left,
                        //                 color: Colors.blue, size: 3.h),
                        //           ),
                        //         )
                        //       : SizedBox.shrink(),
                        // ),
                        // Positioned(
                        //   bottom: 27.5.h,
                        //   left: 80.5.w,
                        //   right: 0.w,
                        //   child: previousProfiles.isNotEmpty
                        //       ? ProfileMatchingCircle(
                        //     completionPercentage: double.tryParse(
                        //         encounteredUserData['matchingPercentage']
                        //             .toString())!,
                        //     size: 40, // ضع النسبة هنا (0-100)
                        //     // حجم الدائرة
                        //   )
                        //       : SizedBox.shrink(),
                        // ),
                      ],
                    )
                  : Center(
                      child: Text(context.lwTranslate
                          .yourDailyLimitForEncountersMayExceedOrThereAre),
                    )),
    );
  }
}
