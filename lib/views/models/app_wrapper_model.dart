import 'package:bizi/redux/states/app_state.dart';
import 'package:bizi/views/models/overlay_model.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class AppWrapperModel {
  final OverlayModel overlayModel;

  final Function({
    Function? pageFunction,
    required OverlayModel overlayModel,
  }) onTap;

  const AppWrapperModel({
    required this.overlayModel,
    required this.onTap,
  });

  static AppWrapperModel fromStore(Store<AppState> store) {
    return AppWrapperModel(
      overlayModel: OverlayModel.fromStore(store),
      onTap: ({
        Function? pageFunction,
        required OverlayModel overlayModel,
      }) {
        overlayModel.disableOverlay();
        if (pageFunction != null) {
          pageFunction();
        }
      },
    );
  }
}
