import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/foundation.dart' show SynchronousFuture;

import 'default_localization.dart';

class DefaultLocalizationsDelegate
    extends LocalizationsDelegate<DefaultLocalizations> {
  const DefaultLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'zh',
      ].contains(locale.languageCode);

  @override
  Future<DefaultLocalizations> load(Locale locale) {
    return SynchronousFuture<DefaultLocalizations>(
        DefaultLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate old) => false;
}
