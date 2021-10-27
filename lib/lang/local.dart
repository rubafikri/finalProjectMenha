import 'dart:ui';
import '../lang/ar_uae.dart';
import 'package:get/get.dart';
import 'en_usa.dart';

class LocalizationService extends Translations {
  static final locale = Locale('ar', 'UAE');
  static final fallbackLocale = Locale('tr', 'TR');
  static final langs = ['Arabic', 'English'];
  static final locales = [
    Locale('ar', 'UAE'),
    Locale('en', 'US'),
  ];
  @override
  Map<String, Map<String, String>> get keys =>
      {'ar_UAE': arUAE, 'en_US': enUSA};
  void changeLocale(String lang) {
    // appGet.lanid = lang;
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  Locale? _getLocaleFromLanguage(String lang) {
    // appGet.lanid = lang;
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
