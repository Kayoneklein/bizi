import 'package:bizi/redux/states/app_state.dart';
import 'package:bizi/service/overlay_service.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class OverlayModel {
  final Function({
    Offset? offset,
    required Widget child,
    double? bottom,
    double? top,
    double? left,
    double? right,
  }) toggleOverlay;
  final Function disableOverlay;
  final bool overlayActive;

  const OverlayModel({
    required this.toggleOverlay,
    required this.disableOverlay,
    required this.overlayActive,
  });

  static OverlayModel fromStore(Store<AppState> store) {
    return OverlayModel(
      toggleOverlay: ({
        Offset? offset,
        required Widget child,
        double? bottom,
        double? top,
        double? left,
        double? right,
      }) {
        OverlayService.showOverlay(
          child: child,
          store: store,
          offset: offset,
          bottom: bottom,
          top: top,
          left: left,
          right: right,
        );
      },
      disableOverlay: () {
        OverlayService.disableOverlay(store);
      },
      overlayActive: store.state.globalAppPropertiesState.overlayActive,
    );
  }
}
