import 'package:flutter/material.dart';
import 'package:flutter_app_study/common/localizations/app_string_base.dart';

import 'app_string_en.dart';
import 'app_string_zh.dart';

class AppLocalizations{
  final Locale locale;
  AppLocalizations(this.locale);

  /// 根据不同 locale.languageCode 加载不同语言对应
  /// AppStringEn和AppStringZh都继承了AppStringBase
  static final Map<String, AppStringBase> _localizedValues = {
    'en': AppStringEn(),
    'zh': AppStringZh(),
  };

  AppStringBase? get currentLocalized {
    return _localizedValues[locale.languageCode] ?? _localizedValues['en'];
  }

  /// 通过 Localizations 加载当前的 AppLocalizations
  /// 获取对应的 AppStringBase
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  /// 通过 Localizations 加载当前的 AppLocalizations
  /// 获取对应的 AppStringBase
  static AppStringBase? i18n(BuildContext context) {
    return (Localizations.of(context, AppLocalizations) as AppLocalizations).currentLocalized;
  }

}

