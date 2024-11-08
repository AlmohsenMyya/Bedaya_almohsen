import 'package:flutter/material.dart';

import 'utils.dart';

class LocaleModel extends ChangeNotifier {
  // Locale? _locale;

  Locale? get locale => Locale(getPreferences('locale', defaultValue: 'en'));

  void set(Locale locale) {
    setPreferences('locale', locale.toString());
    // _locale = locale;
    notifyListeners();
  }
}
