part of '../index.dart';

class ButtonPlacementModel {
  final String alignment;
  final IconData icon;
  final bool leftBorderRadius;
  final bool rightBorderRadius;

  const ButtonPlacementModel({
    required this.alignment,
    required this.icon,
    required this.leftBorderRadius,
    required this.rightBorderRadius,
  });

  static List<ButtonPlacementModel> allSupportedPlacements = [
    ButtonPlacementModel(
      alignment: TextLocalization.left,
      icon: Icons.align_horizontal_left,
      leftBorderRadius: true,
      rightBorderRadius: false,
    ),
    ButtonPlacementModel(
      alignment: TextLocalization.center,
      icon: Icons.align_horizontal_center,
      leftBorderRadius: false,
      rightBorderRadius: false,
    ),
    ButtonPlacementModel(
      alignment: TextLocalization.right,
      icon: Icons.align_horizontal_right,
      leftBorderRadius: false,
      rightBorderRadius: true,
    ),
  ];

  static ButtonPlacementModel filterByPlacement(String alignment) {
    return allSupportedPlacements
        .firstWhere((placement) => placement.alignment == alignment);
  }
}
