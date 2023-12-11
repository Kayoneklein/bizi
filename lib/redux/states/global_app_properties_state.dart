import 'package:bizi/data/language_data.dart';
import 'package:flutter/material.dart';

@immutable
class GlobalAppPropertiesState {
  final bool overlayActive;
  final Locale locale;

  const GlobalAppPropertiesState({
    this.overlayActive = false,
    required this.locale,
  });

  factory GlobalAppPropertiesState.initial() {
    return GlobalAppPropertiesState(
      locale: Locale(LanguageData.selectedLocale.locale),
    );
  }

  GlobalAppPropertiesState copyWith({bool? overlayActive, Locale? locale}) {
    return GlobalAppPropertiesState(
      overlayActive: overlayActive ?? this.overlayActive,
      locale: locale ?? this.locale,
    );
  }

  static GlobalAppPropertiesState fromJson(dynamic json) {
    return GlobalAppPropertiesState(
      overlayActive: json['overlayActive'],
      locale: Locale(json['locale']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'overlayActive': overlayActive,
      'locale': locale.toString(),
    };
  }
}
