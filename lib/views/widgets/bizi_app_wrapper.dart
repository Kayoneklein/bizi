import 'package:bizi/redux/states/app_state.dart';
import 'package:bizi/service/overlay_service.dart';
import 'package:bizi/views/models/app_wrapper_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class BiziAppWrapper extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final AppBar? appBar;
  final bool useScaffold;
  final bool resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final Function? pageFunction;
  const BiziAppWrapper({
    super.key,
    required this.body,
    this.useScaffold = true,
    this.resizeToAvoidBottomInset = false,
    this.appBar,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.pageFunction,
  });

  @override
  Widget build(BuildContext context) {
    overlayState = Overlay.of(context);

    return StoreConnector<AppState, AppWrapperModel>(
      converter: (Store<AppState> store) => AppWrapperModel.fromStore(store),
      onInit: (Store<AppState> store) {
        OverlayService.disableOverlay(store);
      },
      onDispose: (Store<AppState> store) {
        OverlayService.disableOverlay(store);
      },
      builder: (_, pageModel) {
        if (useScaffold) {
          return Scaffold(
            appBar: appBar,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            backgroundColor: backgroundColor,
            body: appBar == null
                ? SafeArea(
                    child: GestureDetector(
                      onTap: () => pageModel.onTap(
                        pageFunction: pageFunction,
                        overlayModel: pageModel.overlayModel,
                      ),
                      child: AbsorbPointer(
                        absorbing: pageModel.overlayModel.overlayActive,
                        child: body,
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () => pageModel.onTap(
                      pageFunction: pageFunction,
                      overlayModel: pageModel.overlayModel,
                    ),
                    child: AbsorbPointer(
                      absorbing: pageModel.overlayModel.overlayActive,
                      child: body,
                    ),
                  ),
            bottomNavigationBar: bottomNavigationBar,
          );
        } else {
          return GestureDetector(
            onTap: () => pageModel.onTap(
              pageFunction: pageFunction,
              overlayModel: pageModel.overlayModel,
            ),
            child: AbsorbPointer(
              absorbing: pageModel.overlayModel.overlayActive,
              child: body,
            ),
          );
        }
      },
    );
  }
}
