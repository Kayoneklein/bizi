part of '../index.dart';

class OnboardingController {
  static int page = 0;

  static final CarouselController controller = CarouselController();

  static changePage(int val, Function? setState) {
    page = val;
    if (setState != null) {
      setState();
    }
  }

  static animateToNextPage(int nextPage, Function setState) {
    if (nextPage > 3) return;
    changePage(nextPage, null);
    controller.animateToPage(page);
    setState();
  }

  static nextButtonAction({
    required BuildContext context,
    required bool isSliderPage,
    required Function setState,
  }) {
    if (!isSliderPage) {
      Navigator.pushNamed(context, RouteName.onBoardingCarousel);
    } else {
      if (page >= 3) {
        changePage(0, () => setState());
        Navigator.pushReplacementNamed(context, RouteName.welcome);
      } else {
        animateToNextPage(page + 1, () => setState());
      }
    }
  }
}
