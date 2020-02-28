import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;

import 'data/abstract_locale_string.dart';
import 'data/locale_string_en.dart';
import 'data/locale_string_zh.dart';

class DefaultLocalizations extends DefaultCupertinoLocalizations {
  final Locale locale;

  DefaultLocalizations(this.locale);

  AbstractLocaleString get localeString =>
      _localizedValues[locale.languageCode];

  static Map<String, AbstractLocaleString> _localizedValues = {
    'en': new LocaleStringEn(),
    'zh': new LocaleStringZh(),
  };

  static AbstractLocaleString of(BuildContext context) {
    return Localizations.of<DefaultLocalizations>(context, DefaultLocalizations)
        .localeString;
  }

  @override
  String get cutButtonLabel => '剪裁';

  @override
  String get copyButtonLabel => '复制';

  @override
  String get pasteButtonLabel => '粘贴';

  @override
  String get selectAllButtonLabel => '全选';
}
