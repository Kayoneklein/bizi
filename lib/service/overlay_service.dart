import 'package:bizi/redux/actions/global_app_properties_actions.dart';
import 'package:bizi/redux/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

///this would be assigned from the [bizi app wrapper file]
late OverlayState overlayState;

class OverlayService {
  static OverlayEntry? overlay;

  static const double width = 122;
  static const double height = 112;

  static OverlayEntry _prepOverlay({
    Offset? offset,
    required Widget child,
    double? bottom,
    double? top,
    double? left,
    double? right,
  }) {
    OverlayEntry overlay1 = OverlayEntry(builder: (context) {
      return Positioned(
        left: left,
        top: top,
        bottom: bottom,
        right: right,
        child: child,
      );
    });
    return overlay1;
  }

  static void showOverlay({
    Offset? offset,
    required Widget child,
    required Store<AppState> store,
    double? bottom,
    double? top,
    double? left,
    double? right,
  }) {
    if (store.state.globalAppPropertiesState.overlayActive == false) {
      overlay = _prepOverlay(
        offset: offset,
        child: child,
        bottom: bottom,
        right: right,
        top: top,
        left: left,
      );
      overlayState.insert(overlay!);
      store.dispatch(const ToggleOverlay(true));
    } else {
      overlay?.remove();
      overlay = null;
      store.dispatch(const ToggleOverlay(false));
    }
  }

  static void disableOverlay(Store<AppState> store) {
    store.dispatch(const ToggleOverlay(false));
    overlay?.remove();
    overlay = null;
  }
}
