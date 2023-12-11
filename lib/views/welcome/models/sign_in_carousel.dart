part of '../index.dart';

class SignInCarouselModel {
  final String description;
  final Color color;
  final int index;

  SignInCarouselModel({
    required this.description,
    required this.color,
    required this.index,
  });

  static SignInCarouselModel activeSlider = _sliders.first;
}

List<SignInCarouselModel> _sliders = [
  SignInCarouselModel(
    description:
        TextLocalization.whatIsBiziHowWillThisTakeMyBusinessTpTheNextLevel,
    color: BColors.blue,
    index: 0,
  ),
  SignInCarouselModel(
    description:
        TextLocalization.createShareableContentThatDrivesRecipientEngagement,
    color: BColors.lightGreen,
    index: 1,
  ),
  SignInCarouselModel(
    description: TextLocalization.createDemandForYourOwnBusiness,
    color: BColors.lightRed,
    index: 2,
  ),
  SignInCarouselModel(
    description: TextLocalization.beOneStepAheadOfYourCompetitors,
    color: BColors.purple,
    index: 3,
  ),
];
