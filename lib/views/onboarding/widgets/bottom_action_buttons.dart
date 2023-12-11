part of '../index.dart';

class BottomActionButtons extends StatelessWidget {
  final bool isSliderPage;
  final Function setState;
  const BottomActionButtons({
    super.key,
    this.isSliderPage = false,
    required this.setState,
  });

  @override
  Widget build(BuildContext context) {
    OverlayState? overlayState = Overlay.of(context);
    return StoreConnector<AppState, OverlayModel>(
        converter: (Store<AppState> store) => OverlayModel.fromStore(store),
        builder: (_, pageModel) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                text: TextLocalization.skip,
                onPressed: () {
                  ///clear any open overlay before navigating to the next screen
                  if (pageModel.overlayActive == true) {
                    pageModel.disableOverlay(overlayState);
                  }
                  if (isSliderPage) {
                    Navigator.pushReplacementNamed(context, RouteName.welcome);
                  } else {
                    Navigator.pushNamed(context, RouteName.welcome);
                  }
                },
                color: BColors.fadedBlack,
              ),
              Button(
                text: TextLocalization.next,
                onPressed: () {
                  ///clear any open overlay before navigating to the next screen
                  if (pageModel.overlayActive == true) {
                    pageModel.disableOverlay();
                  }
                  OnboardingController.nextButtonAction(
                    context: context,
                    isSliderPage: isSliderPage,
                    setState: () => setState(),
                  );
                },
                backgroundColor: BColors.disabledBlue,
                size: const Size(92, 44),
              ),
            ],
          );
        });
  }
}
