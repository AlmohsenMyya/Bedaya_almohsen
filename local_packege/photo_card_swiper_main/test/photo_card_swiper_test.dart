// library photo_card_swiper;
//
// import 'package:flutter/material.dart';
// import 'package:photo_card_swiper/custom_widgets/feedback_photo_card_widget.dart';
// import 'package:photo_card_swiper/custom_widgets/loading_data_photo_card.dart';
// import 'package:photo_card_swiper/custom_widgets/photo_card_layout_widget.dart';
// import 'package:photo_card_swiper/models/photo_card.dart';
// import 'package:photo_card_swiper/notifiers/feedback_photo_card_value_notifier.dart';
//
// //State of card movement
// enum CardActionDirection {
//   cardFarLeftAction,
//   cardLeftAction,
//   cardCenterAction,
//   cardRightAction,
//   cardFarRightAction,
//   cardActionNone
// }
//
// const String _stackViewKey = 'photo_card_stack_view';
//
// class PhotoCardSwiper extends StatefulWidget {
//   final List<PhotoCard> photos;
//   final Function? cardSwiped;
//   final bool showLoading;
//   final bool hideCenterButton;
//   final bool hideTitleText;
//   final bool hideDescriptionText;
//   final BoxFit imageScaleType;
//   final Color? imageBackgroundColor;
//   final IconData? farLeftButtonIcon;
//   final IconData? leftButtonIcon;
//   final IconData? centerButtonIcon;
//   final IconData? rightButtonIcon;
//   final IconData? farRightButtonIcon;
//   final Color? farLeftButtonIconColor;
//   final Color? farLeftButtonBackgroundColor;
//   final Color? leftButtonIconColor;
//   final Color? leftButtonBackgroundColor;
//   final Color? centerButtonIconColor;
//   final Color? centerButtonBackgroundColor;
//   final Color? rightButtonIconColor;
//   final Color? rightButtonBackgroundColor;
//   final Color? farRightButtonIconColor;
//   final Color? farRightButtonBackgroundColor;
//   final Function? farLeftButtonAction;
//   final Function? leftButtonAction;
//   final Function? centerButtonAction;
//   final Function? rightButtonAction;
//   final Function? farRightButtonAction;
//   final Function? onCardTap;
//   final Color cardBgColor;
//
//   PhotoCardSwiper({
//     required this.photos,
//     this.cardSwiped,
//     this.showLoading = true,
//     this.imageScaleType = BoxFit.cover,
//     this.imageBackgroundColor = Colors.black87,
//     this.hideCenterButton = false,
//     this.hideTitleText = false,
//     this.hideDescriptionText = false,
//     this.farLeftButtonIcon,
//     this.leftButtonIcon,
//     this.centerButtonIcon,
//     this.rightButtonIcon,
//     this.farRightButtonIcon,
//     this.farLeftButtonIconColor,
//     this.farLeftButtonBackgroundColor,
//     this.leftButtonIconColor,
//     this.leftButtonBackgroundColor,
//     this.centerButtonIconColor,
//     this.centerButtonBackgroundColor,
//     this.rightButtonIconColor,
//     this.rightButtonBackgroundColor,
//     this.farRightButtonIconColor,
//     this.farRightButtonBackgroundColor,
//     this.farLeftButtonAction,
//     this.leftButtonAction,
//     this.centerButtonAction,
//     this.rightButtonAction,
//     this.farRightButtonAction,
//     this.onCardTap,
//     this.cardBgColor = Colors.black,
//   });
//
//   @override
//   _PhotoCardSwiperState createState() => _PhotoCardSwiperState();
// }
//
// class _PhotoCardSwiperState extends State<PhotoCardSwiper> {
//   final double _topPadding = 10.0;
//   final double _bottomPadding = 35.0;
//   final double _offset = 6.0;
//   final double _leftPadding = 15.0;
//   final double _rightPadding = 15.0;
//   List<PhotoCard> _updatedPhotos = [];
//   List<PhotoCard> _reversedPhotos = [];
//
//   // States for photo card layout widget
//   bool _isPhotoCardFarLeftOverlayShown = false;
//   bool _isPhotoCardLeftOverlayShown = false;
//   bool _isPhotoCardRightOverlayShown = false;
//   bool _isPhotoCardFarRightOverlayShown = false;
//   bool _isPhotoCardCenterOverlayShown = false;
//
//   FeedbackPhotoCardValueNotifier _feedbackPhotoCardValueNotifier =
//   FeedbackPhotoCardValueNotifier();
//
//   @override
//   void initState() {
//     super.initState();
//     _reversedPhotos = widget.photos.reversed.toList();
//     _updatedPhotos = _reversedPhotos;
//   }
//
//   @override
//   void didUpdateWidget(covariant PhotoCardSwiper oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _reversedPhotos = widget.photos.reversed.toList();
//     setState(() {
//       _updatedPhotos = _reversedPhotos;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final double _maxHeight = constraints.maxHeight;
//         final double _maxWidth = constraints.maxWidth;
//         final int _totalPhotos = _updatedPhotos.length;
//         final double _extraOffset = _totalPhotos * _offset;
//         final double _cardHeight =
//             _maxHeight - (_topPadding + _bottomPadding + _extraOffset);
//         final double _cardWidth = _maxWidth - (_leftPadding + _rightPadding);
//
//         return Container(
//           padding: EdgeInsets.only(
//               left: 15.0,
//               bottom: _bottomPadding,
//               top: _topPadding,
//               right: 15.0),
//           child: (_updatedPhotos.isEmpty && widget.showLoading)
//               ? LoadingDataPhotoCardWidget(
//               cardHeight: _cardHeight,
//               cardWidth: _cardWidth,
//               hideCenterButton: widget.hideCenterButton,
//               isLoading: true,
//               cardBgColor: widget.cardBgColor)
//               : Stack(
//             key: Key(_stackViewKey),
//             children: _updatedPhotos.map(
//                   (_updatedPhoto) {
//                 final _index = _reversedPhotos.indexWhere((_photo) {
//                   return _photo.cardId.toLowerCase() ==
//                       _updatedPhoto.cardId.toLowerCase();
//                 });
//
//                 final _reverseOffset =
//                     (_updatedPhotos.length - 1) - _index;
//                 final _topOffsetForCard = _offset * _reverseOffset;
//
//                 final _updatedCardHeight =
//                     _cardHeight - (_offset * (_index));
//
//                 final _tapIndex = (widget.photos.length - 1) - _index;
//
//                 return Positioned(
//                   top: _topOffsetForCard,
//                   child: Draggable(
//                     axis: Axis.horizontal,
//                     childWhenDragging: Container(),
//                     maxSimultaneousDrags: 0,
//                     onDragCompleted: () {
//                       _hideAllPhotoCardOverlayWidgets();
//                     },
//                     onDragStarted: () {},
//                     onDragEnd: (details) {
//                       _hideAllPhotoCardOverlayWidgets();
//                       if (details.offset.dx > 200.0) {
//                         _updatedPhotos.removeAt(_index);
//                         _likeCard(forIndex: _index);
//                       } else if (details.offset.dx > 100.0) {
//                         _updatedPhotos.removeAt(_index);
//                         _likeFarRightCard(forIndex: _index);
//                       } else if (details.offset.dx < -200.0) {
//                         _updatedPhotos.removeAt(_index);
//                         _unlikeCard(forIndex: _index);
//                       } else if (details.offset.dx < -100.0) {
//                         _updatedPhotos.removeAt(_index);
//                         _unlikeFarLeftCard(forIndex: _index);
//                       }
//                     },
//                     onDragUpdate: (DragUpdateDetails details) {
//                       if (details.delta.dx < -3) {
//                         _feedbackPhotoCardValueNotifier
//                             .updateCardSwipeActionValue(
//                             value:
//                             CardActionDirection.cardFarLeftAction);
//                       } else if (details.delta.dx > 3) {
//                         _feedbackPhotoCardValueNotifier
//                             .updateCardSwipeActionValue(
//                             value:
//                             CardActionDirection.cardFarRightAction);
//                       }
//                     },
//                     feedback: FeedbackPhotoCardWidget(
//                         cardHeight: _updatedCardHeight,
//                         cardWidth: _cardWidth,
//                         photoCard: _updatedPhoto,
//                         leftButtonIcon: widget.leftButtonIcon,
//                         rightButtonIcon: widget.rightButtonIcon,
//                         centerButtonIcon: widget.centerButtonIcon,
//                         hideCenterButton: widget.hideCenterButton,
//                         hideTitleText: widget.hideTitleText,
//                         hideDescriptionText: widget.hideDescriptionText,
//                         imageScaleType: widget.imageScaleType,
//                         imageBackgroundColor: widget.imageBackgroundColor,
//                         feedbackPhotoCardValueNotifier:
//                         _feedbackPhotoCardValueNotifier,
//                         leftButtonIconColor: widget.leftButtonIconColor,
//                         leftButtonBackgroundColor:
//                         widget.leftButtonBackgroundColor,
//                         centerButtonBackgroundColor:
//                         widget.centerButtonBackgroundColor,
//                         centerButtonIconColor:
//                         widget.centerButtonIconColor,
//                         rightButtonBackgroundColor:
//                         widget.rightButtonBackgroundColor,
//                         rightButtonIconColor: widget.rightButtonIconColor,
//                         cardBgColor: widget.cardBgColor),
//                     child: PhotoCardLayoutWidget(
//                       cardBgColor: widget.cardBgColor,
//                       cardHeight: _updatedCardHeight,
//                       cardWidth: _cardWidth,
//                       imageScaleType: widget.imageScaleType,
//                       imageBackgroundColor: widget.imageBackgroundColor,
//                       hideCenterButton: widget.hideCenterButton,
//                       hideTitleText: widget.hideTitleText,
//                       hideDescriptionText: widget.hideDescriptionText,
//                       photoCard: _updatedPhoto,
//                       leftButtonIcon: widget.leftButtonIcon,
//                       rightButtonIcon: widget.rightButtonIcon,
//                       centerButtonIcon: widget.centerButtonIcon,
//                       farLeftButtonIcon: widget.farLeftButtonIcon,
//                       farRightButtonIcon: widget.farRightButtonIcon,
//                       leftButtonIconColor: widget.leftButtonIconColor,
//                       leftButtonBackgroundColor:
//                       widget.leftButtonBackgroundColor,
//                       centerButtonBackgroundColor:
//                       widget.centerButtonBackgroundColor,
//                       centerButtonIconColor:
//                       widget.centerButtonIconColor,
//                       rightButtonBackgroundColor:
//                       widget.rightButtonBackgroundColor,
//                       rightButtonIconColor: widget.rightButtonIconColor,
//                       farLeftButtonIconColor: widget.farLeftButtonIconColor,
//                       farLeftButtonBackgroundColor:
//                       widget.farLeftButtonBackgroundColor,
//                       farRightButtonIconColor: widget.farRightButtonIconColor,
//                       farRightButtonBackgroundColor:
//                       widget.farRightButtonBackgroundColor,
//                       onLeftButtonTap: () {
//                         widget.leftButtonAction?.call();
//                       },
//                       onCenterButtonTap: () {
//                         widget.centerButtonAction?.call();
//                       },
//                       onRightButtonTap: () {
//                         widget.rightButtonAction?.call();
//                       },
//                       onFarLeftButtonTap: () {
//                         widget.farLeftButtonAction?.call();
//                       },
//                       onFarRightButtonTap: () {
//                         widget.farRightButtonAction?.call();
//                       },
//                       onTap: () {
//                         widget.onCardTap?.call(_tapIndex);
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ).toList(),
//           ),
//         );
//       },
//     );
//   }
//
//   void _hideAllPhotoCardOverlayWidgets() {
//     _isPhotoCardFarLeftOverlayShown = false;
//     _isPhotoCardLeftOverlayShown = false;
//     _isPhotoCardCenterOverlayShown = false;
//     _isPhotoCardRightOverlayShown = false;
//     _isPhotoCardFarRightOverlayShown = false;
//   }
//
//   void _likeFarRightCard({required int forIndex}) {
//     if (widget.cardSwiped != null) {
//       widget.cardSwiped!(CardActionDirection.cardFarRightAction, forIndex);
//     }
//   }
//
//   void _likeCard({required int forIndex}) {
//     if (widget.cardSwiped != null) {
//       widget.cardSwiped!(CardActionDirection.cardRightAction, forIndex);
//     }
//   }
//
//   void _unlikeCard({required int forIndex}) {
//     if (widget.cardSwiped != null) {
//       widget.cardSwiped!(CardActionDirection.cardLeftAction, forIndex);
//     }
//   }
//
//   void _unlikeFarLeftCard({required int forIndex}) {
//     if (widget.cardSwiped != null) {
//       widget.cardSwiped!(CardActionDirection.cardFarLeftAction, forIndex);
//     }
//   }
// }
