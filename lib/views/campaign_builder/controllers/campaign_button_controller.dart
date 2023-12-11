part of '../index.dart';

enum ButtonEditState { initial, buttonAction, color, buttonPlacement }

class CampaignButtonController {
  static ButtonEditState buttonEditState = ButtonEditState.initial;

  static void changeButtonAction() {
    buttonEditState = ButtonEditState.buttonAction;
  }

  static void setInitialButtonState() {
    buttonEditState = ButtonEditState.initial;
  }

  static void setColorEditAction() {
    buttonEditState = ButtonEditState.color;
  }

  static void editButtonPlacement() {
    buttonEditState = ButtonEditState.buttonPlacement;
  }
}
