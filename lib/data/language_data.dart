import 'package:bizi/constants/b_icons.dart';
import 'package:bizi/models/language_setting_model.dart';

class LanguageData {
  static List<LanguageSettingModel> get allLocales => _locales;

  static LanguageSettingModel selectedLocale = LanguageSettingModel(
    flag: BIcons.england,
    language: 'English',
    locale: 'en',
  );

  static final List<LanguageSettingModel> _locales = [
    LanguageSettingModel(
      flag: BIcons.england,
      language: 'English',
      locale: 'en',
    ),
    LanguageSettingModel(
      flag: BIcons.spanish,
      language: 'Español',
      locale: 'es',
    ),
  ];
}
