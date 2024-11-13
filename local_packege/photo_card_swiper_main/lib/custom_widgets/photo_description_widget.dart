import 'package:photo_card_swiper/models/photo_card.dart';
import 'package:flutter/material.dart';

class PhotoDescriptionWidget extends StatelessWidget {
  const PhotoDescriptionWidget({
    Key? key,
    required this.photoCard,
  }) : super(key: key);

  final PhotoCard photoCard;

  @override
  Widget build(BuildContext context) {
    return photoCard.description;
  }
}
