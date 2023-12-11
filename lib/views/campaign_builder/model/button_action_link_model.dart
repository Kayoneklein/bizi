part of '../index.dart';

class ButtonLinkType {
  static const String whatsapp = 'whatsapp';
  static const String link = 'link';
  static const String email = 'email';
  static const String telegram = 'telegram';
  static const String phone = 'phone';
}

class ButtonActionLinkModel {
  final String type;
  final String icon;
  final bool isDisabled;

  const ButtonActionLinkModel({
    required this.type,
    required this.icon,
    required this.isDisabled,
  });

  static List<ButtonActionLinkModel> supportedLinkTypes = const [
    ButtonActionLinkModel(
        type: ButtonLinkType.link, icon: BIcons.link, isDisabled: false),
    ButtonActionLinkModel(
        type: ButtonLinkType.email, icon: BIcons.emailWhite, isDisabled: false),
    ButtonActionLinkModel(
        type: ButtonLinkType.phone, icon: BIcons.phone, isDisabled: true),
    ButtonActionLinkModel(
        type: ButtonLinkType.telegram, icon: BIcons.telegram, isDisabled: true),
    ButtonActionLinkModel(
        type: ButtonLinkType.whatsapp, icon: BIcons.whatsapp, isDisabled: true),
  ];

  static ButtonActionLinkModel filterByType(String type) {
    return supportedLinkTypes.firstWhere((btnType) => btnType.type == type);
  }
}
