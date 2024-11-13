import 'package:flutter/material.dart';

class PhotoCard {
  final String title;
  final Widget description;
  final Widget itemWidget;
  final bool isLocalImage;
  final String cardId;

  PhotoCard({
    this.title = "",
    required this.description,
    required this.itemWidget,
    this.isLocalImage = true,
    required this.cardId,
  });
}
