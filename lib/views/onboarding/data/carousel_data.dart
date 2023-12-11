part of '../index.dart';

class CarouselData {
  final List<OnboardingCarouselViewModel> _carouselList = _getCarouselData();

  List<OnboardingCarouselViewModel> get carouselList => _carouselList;

  static List<OnboardingCarouselViewModel> _getCarouselData() {
    List<OnboardingCarouselViewModel> list = [
      OnboardingCarouselViewModel(
        title: TextLocalization.dragElement,
        topChild: Image.asset(BImages.onboard1),
        description: TextLocalization.dragAndDrop,
      ),
      OnboardingCarouselViewModel(
        title: TextLocalization.setImage,
        topChild: Image.asset(BImages.onboard2),
        description: TextLocalization.seeWhichPieces,
      ),
      OnboardingCarouselViewModel(
        title: TextLocalization.connectButton,
        topChild: Image.asset(BImages.onboard3),
        description: TextLocalization.buttonsCanBe,
      ),
      OnboardingCarouselViewModel(
        title: TextLocalization.launch,
        topChild: Image.asset(
          BImages.onboard4,
          height: 340,
        ),
        description: TextLocalization.yourCampaignIsNowReady,
      ),
    ];

    return list;
  }
}
