part of '../index.dart';

class ButtonColorModel {
  final Color color;
  // final String icon;

  const ButtonColorModel({required this.color});

  static List<ButtonColorModel> supportedButtonColors = [
    const ButtonColorModel(
      color: BColors.blue,
    ),
    const ButtonColorModel(
      color: BColors.yellow,
    ),
    const ButtonColorModel(
      color: BColors.green,
    ),
    const ButtonColorModel(
      color: BColors.red,
    ),
    const ButtonColorModel(
      color: BColors.lemon,
    ),
    const ButtonColorModel(
      color: BColors.orange,
    ),
    const ButtonColorModel(
      color: BColors.black,
    ),
    const ButtonColorModel(
      color: BColors.brown,
    ),
    const ButtonColorModel(
      color: BColors.pink,
    ),
    const ButtonColorModel(
      color: BColors.purple,
    ),
    const ButtonColorModel(
      color: BColors.grey,
    ),
    const ButtonColorModel(
      color: BColors.black,
    ),
    const ButtonColorModel(
      color: BColors.redBackground,
    ),
    const ButtonColorModel(
      color: BColors.lightGrey,
    ),
  ];

  static ButtonColorModel filterByColor(Color color) {
    return supportedButtonColors
        .firstWhere((btnColor) => btnColor.color == color);
  }
}
