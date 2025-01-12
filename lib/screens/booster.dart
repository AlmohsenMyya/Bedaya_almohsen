import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:photo_card_swiper/models/photo_card.dart';
import '../common/services/data_transport.dart' as data_transport;
import '../common/services/utils.dart';
import '../common/widgets/common.dart';
import 'purchase.dart';

class BoosterPage extends StatefulWidget {
  const BoosterPage({super.key});

  @override
  BoosterPageState createState() => BoosterPageState();
}

class BoosterPageState extends State<BoosterPage>
    with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PhotoCard? encounterCard;
  Map encounteredUserData = {};
  bool isLoaded = false;
  bool isCountUpdating = false;
  bool encounterAvailability = false;
  bool isListenerSet = false;
  Map boosterInfo = {};
  int remainingBoosterTime = 0;
  late CustomTimerController _customTimerController;
  int? creditsRemaining;
  late ConfettiController _confettiController;

  @override
  void initState() {
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    if (mounted) {
      _customTimerController = CustomTimerController(
        vsync: this,
        begin: const Duration(),
        end: const Duration(),
      );
      getBoosterInfo();
    }
    super.initState();
  }

  getBoosterInfo() async {
    setState(() {
      isCountUpdating = true;
    });
    return data_transport.get(
      'get-booster-info',
      context: context,
      onSuccess: (responseData) {
        _customTimerController.finish();
        setState(() {
          isLoaded = true;
          isCountUpdating = false;
          boosterInfo = getItemValue(responseData, 'data');
          remainingBoosterTime = boosterInfo['remaining_booster_time'];
        });
        if (remainingBoosterTime > 0) {
          _customTimerController.end = const Duration();
          _customTimerController.begin = Duration(
            seconds: remainingBoosterTime,
          );
          _customTimerController.start();
          if (!isListenerSet) {
            // set the listener
            _customTimerController.state.addListener(() {
              if (_customTimerController.state.value ==
                  CustomTimerState.finished) {
                setState(() {
                  remainingBoosterTime = 0;
                  _customTimerController.finish();
                });
              }
              setState(() {
                isListenerSet = true;
              });
            });
          }
        }
      },
    );
  }
//55
  @override
  void dispose() {
    _confettiController.dispose();
    if (mounted) {
      _customTimerController.dispose();
      // remove all receivers from the environment
      FBroadcast.instance().unregister(this);
    }
    super.dispose();
  }

  void _activateSuperMode() {
    // تشغيل تأثير الاحتفال
    _confettiController.play();

    // تشغيل الصوت
    final player = AudioPlayer();
    player.play(AssetSource('audio/celebration.mp3'));

    // إضافة منطق تفعيل وضع السوبر
    print("Super Mode Activated!");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: mainAppBarWidget(
          context: context,
          title: context.lwTranslate.boostMyProfile,
          actionWidgets: []),
      body: !isLoaded
          ? const Center(child: AppItemProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // تأثير الاحتفال
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,

                    shouldLoop: false,
                    colors: const [
                      Colors.red,
                      Colors.blue,
                      Colors.yellow,
                      Colors.green,
                      Colors.purple
                    ],
                    numberOfParticles: 20,
                  ),
                  if (remainingBoosterTime > 0)
                    Column(
                      children: [
                        const Icon(
                          Icons.bolt,
                          size: 164,
                        ),
                        Text(
                          context.lwTranslate.yourProfileIsBoostedFor,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        CustomTimer(
                            controller: _customTimerController,
                            builder: (state, time) {
                              return Text(
                                "${time.hours}:${time.minutes}:${time.seconds}",
                                style: TextStyle(
                                  fontSize: 62,
                                  color: Theme.of(context).primaryColor,
                                ),
                              );
                            }),
                        const Divider(),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      context.lwTranslate.byBoostingYourProfileYouWillBeAPartOf(
                          getItemValue(boosterInfo, 'booster_price'),
                          getItemValue(boosterInfo, 'booster_period')),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  if (isCountUpdating)
                    const AppItemProgressIndicator()
                  else
                    Stack(alignment: Alignment.center, children: [

                      //
                      ElevatedButton(
                        onPressed: (() {
                          data_transport.post(
                            'boost-profile',
                            thenCallback: (responseData) {
                              if (getItemValue(responseData, 'reaction') == 2) {
                                setState(() {
                                  creditsRemaining = getItemValue(
                                      responseData, 'data.creditsRemaining',
                                      fallbackValue: '');
                                });
                                showToastMessage(
                                  context,
                                  getItemValue(
                                    responseData,
                                    'data.message',
                                    fallbackValue: '',
                                  ),
                                  type: 'error',
                                );
                              }
                            },
                            onSuccess: (responseData) async {
                              _activateSuperMode();
                              FBroadcast.instance().broadcast(
                                "local.broadcast.credits_update",
                                value: {},
                              );
                              await getBoosterInfo();
                            },
                          );
                        }),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                (remainingBoosterTime > 0)
                                    ? context.lwTranslate.boostAgain
                                    : context.lwTranslate.boostMyProfile,
                                style: const TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ]),
                  if (creditsRemaining != null && creditsRemaining! <= 0)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          navigatePage(
                            context,
                             PurchasePage(),
                          );
                        },
                        child: Text(context.lwTranslate.buyCredits),
                      ),
                    )
                ],
              ),
            ),
    );
  }
}
