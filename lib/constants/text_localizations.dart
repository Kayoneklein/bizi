import 'package:bizi/data/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextLocalization {
  static final BuildContext context = navigatorKey.currentContext!;

  ///GENERAL TEXTS
  static String next = AppLocalizations.of(context)?.next ?? '';
  static String skip = AppLocalizations.of(context)?.skip ?? '';
  static String action = AppLocalizations.of(context)?.action ?? '';
  static String preview = AppLocalizations.of(context)?.preview ?? '';
  static String done = AppLocalizations.of(context)?.done ?? '';
  static String myCampaigns = AppLocalizations.of(context)?.myCampaigns ?? '';
  static String bizi = AppLocalizations.of(context)?.bizi ?? '';
  static String or = AppLocalizations.of(context)?.or ?? '';
  static String engagements = AppLocalizations.of(context)?.engagements ?? '';
  static String analytics = AppLocalizations.of(context)?.analytics ?? '';
  static String edit = AppLocalizations.of(context)?.edit ?? '';
  static String share = AppLocalizations.of(context)?.share ?? '';
  static String business = AppLocalizations.of(context)?.business ?? '';
  static String personal = AppLocalizations.of(context)?.personal ?? '';
  static String buttonAction = AppLocalizations.of(context)?.buttonAction ?? '';
  static String color = AppLocalizations.of(context)?.color ?? '';
  static String left = AppLocalizations.of(context)?.left ?? '';
  static String center = AppLocalizations.of(context)?.center ?? '';
  static String right = AppLocalizations.of(context)?.right ?? '';
  static String url = AppLocalizations.of(context)?.url ?? '';
  static String back = AppLocalizations.of(context)?.back ?? '';
  static String info = AppLocalizations.of(context)?.info ?? '';
  static String image = AppLocalizations.of(context)?.image ?? '';
  static String button = AppLocalizations.of(context)?.button ?? '';
  static String video = AppLocalizations.of(context)?.video ?? '';
  static String audio = AppLocalizations.of(context)?.audio ?? '';
  static String search = AppLocalizations.of(context)?.search ?? '';
  static String searchACampaign =
      AppLocalizations.of(context)?.searchACampaign ?? '';
  static String delete = AppLocalizations.of(context)?.delete ?? '';
  static String yes = AppLocalizations.of(context)?.yes ?? '';
  static String no = AppLocalizations.of(context)?.no ?? '';
  static String cancel = AppLocalizations.of(context)?.cancel ?? '';
  static String home = AppLocalizations.of(context)?.home ?? '';
  static String announcement = AppLocalizations.of(context)?.announcement ?? '';
  static String campaign = AppLocalizations.of(context)?.campaign ?? '';
  static String card = AppLocalizations.of(context)?.card ?? '';
  static String profile = AppLocalizations.of(context)?.profile ?? '';
  static String isAnInvalidRouteNotDefinedInThisApp =
      AppLocalizations.of(context)?.isAnInvalidRouteNotDefinedInThisApp ?? '';
  static String login = AppLocalizations.of(context)?.login ?? '';
  static String signup = AppLocalizations.of(context)?.signup ?? '';
  static String signInWithApple =
      AppLocalizations.of(context)?.signInWithApple ?? '';
  static String signInWithGoogle =
      AppLocalizations.of(context)?.signInWithGoogle ?? '';
  static String signInWithEmail =
      AppLocalizations.of(context)?.signInWithEmail ?? '';
  static String apple = AppLocalizations.of(context)?.apple ?? '';
  static String google = AppLocalizations.of(context)?.google ?? '';
  static String loginWithEmail =
      AppLocalizations.of(context)?.loginWithEmail ?? '';
  static String thisRequestWasSuccessful =
      AppLocalizations.of(context)?.thisRequestWasSuccessful ?? '';
  static String weCouldNotFetchUserData =
      AppLocalizations.of(context)?.weCouldNotFetchUserData ?? '';
  static String pleaseCheckYourEmailToResetYourPassword =
      AppLocalizations.of(context)?.pleaseCheckYourEmailToResetYourPassword ??
          '';
  static String anErrorOccurredWhileSigningYouIn =
      AppLocalizations.of(context)?.anErrorOccurredWhileSigningYouIn ?? '';
  static String appleSignInFailed =
      AppLocalizations.of(context)?.appleSignInFailed ?? '';
  static String passwordsMustContainAtLeast6Characters =
      AppLocalizations.of(context)?.passwordsMustContainAtLeast6Characters ??
          '';
  static String passwordsMustContainSpecialCharacters =
      AppLocalizations.of(context)?.passwordsMustContainSpecialCharacters ?? '';
  static String passwordsMustContainNumbers =
      AppLocalizations.of(context)?.passwordsMustContainNumbers ?? '';
  static String passwordsMustContainLowercaseLetters =
      AppLocalizations.of(context)?.passwordsMustContainLowercaseLetters ?? '';
  static String passwordsMustContainUppercaseLetters =
      AppLocalizations.of(context)?.passwordsMustContainUppercaseLetters ?? '';
  static String enterPassword =
      AppLocalizations.of(context)?.enterPassword ?? '';
  static String enterValidEmail =
      AppLocalizations.of(context)?.enterValidEmail ?? '';
  static String sendResetEmail =
      AppLocalizations.of(context)?.sendResetEmail ?? '';
  static String enterFirstName =
      AppLocalizations.of(context)?.enterFirstName ?? '';
  static String enterLastName =
      AppLocalizations.of(context)?.enterLastName ?? '';

  ///ON-BOARDING TEXTS
  static String creatingACampaign =
      AppLocalizations.of(context)?.creatingACampaign ?? '';
  static String hereIsASimple = AppLocalizations.of(context)
          ?.hereIsASimpleStepByStepProcessOfHowToCreateACampaign ??
      '';
  static String dragElement = AppLocalizations.of(context)?.dragElements ?? '';
  static String dragAndDrop = AppLocalizations.of(context)
          ?.dragAndDropElementsThatFitWithYourCampaignNeeds ??
      '';
  static String setImage =
      AppLocalizations.of(context)?.setImageAndFillInCopy ?? '';
  static String seeWhichPieces = AppLocalizations.of(context)
          ?.seeWhichPiecesOfContentRecipientsEngageAndTakeAction ??
      '';
  static String connectButton =
      AppLocalizations.of(context)?.connectButton ?? '';
  static String buttonsCanBe = AppLocalizations.of(context)
          ?.buttonsCanBeConnectedWithAnActionSuchAsURL ??
      '';
  static String launch = AppLocalizations.of(context)?.launch ?? '';
  static String yourCampaignIsNowReady =
      AppLocalizations.of(context)?.yourCampaignIsNowReadyToBeSeenByTheWorld ??
          '';
  static String pleaseEnterAValidLink =
      AppLocalizations.of(context)?.pleaseEnterAValidLink ?? '';
  static String checkUsOut = AppLocalizations.of(context)?.checkUsOut ?? '';

  /// WELCOME SCREEN
  static String whatIsProjectBizi = AppLocalizations.of(context)
          ?.whatIsProjectBiziAndHowItWillBenefitTheUser ??
      '';
  static String signUpWithEmail =
      AppLocalizations.of(context)?.signUpWithEmail ?? '';
  static String signUpWithApple =
      AppLocalizations.of(context)?.signUpWithApple ?? '';
  static String signUpWithGoogle =
      AppLocalizations.of(context)?.signUpWithGoogle ?? '';
  static String byJoiningThisApp =
      AppLocalizations.of(context)?.byJoiningThisAppYouAgreeTo ?? '';
  static String our = AppLocalizations.of(context)?.our ?? '';
  static String termsAndConditions =
      AppLocalizations.of(context)?.termsAndConditions ?? '';

  ///signUp Screen ===> welcome screen
  static String firstName = AppLocalizations.of(context)?.firstName ?? '';
  static String lastName = AppLocalizations.of(context)?.lastName ?? '';
  static String emailAddress = AppLocalizations.of(context)?.emailAddress ?? '';
  static String password = AppLocalizations.of(context)?.password ?? '';
  static String createAccount =
      AppLocalizations.of(context)?.createAccount ?? '';
  static String whatIsBiziHowWillThisTakeMyBusinessTpTheNextLevel =
      AppLocalizations.of(context)
              ?.whatIsBiziHowWillThisTakeMyBusinessTpTheNextLevel ??
          '';
  static String createShareableContentThatDrivesRecipientEngagement =
      AppLocalizations.of(context)
              ?.createShareableContentThatDrivesRecipientEngagement ??
          '';
  static String createDemandForYourOwnBusiness =
      AppLocalizations.of(context)?.createDemandForYourOwnBusiness ?? '';
  static String beOneStepAheadOfYourCompetitors =
      AppLocalizations.of(context)?.beOneStepAheadOfYourCompetitors ?? '';
  static String forgotPassword =
      AppLocalizations.of(context)?.forgotPassword ?? '';
  static String termsAndConditionCase =
      AppLocalizations.of(context)?.termsAndConditionCase ?? '';

  ///HOME SCREEN
  static String welcome = AppLocalizations.of(context)?.welcome ?? '';
  static String last28Days = AppLocalizations.of(context)?.last28Days ?? '';
  static String mostRecentCampaigns =
      AppLocalizations.of(context)?.mostRecentCampaigns ?? '';
  static String ifTheTyleRaidersWinYouWin =
      AppLocalizations.of(context)?.ifTheTyleRaidersWinYouWin ?? '';
  static String signTheTappshareNda =
      AppLocalizations.of(context)?.signTheTappshareNda ?? '';
  static String yourBusinessCards =
      AppLocalizations.of(context)?.yourBusinessCards ?? '';
  static String actions = AppLocalizations.of(context)?.actions ?? '';

  /// BUSINESS CARD SCREEN
  static String aboutMe = AppLocalizations.of(context)?.aboutMe ?? '';
  static String saveContact = AppLocalizations.of(context)?.saveContact ?? '';
  static String sendAMessage(String name) =>
      AppLocalizations.of(context)?.sendAMessage(name) ?? '';

  ///CAMPAIGN BUILDER
  static String campaignTitle =
      AppLocalizations.of(context)?.campaignTitle ?? '';
  static String buttonText = AppLocalizations.of(context)?.buttonText ?? '';
  static String buttonPlacement =
      AppLocalizations.of(context)?.buttonPlacement ?? '';
  // static String writeCaption = AppLocalizations.of(context)?.writeCaption ?? '';
  // static String writeDescription = AppLocalizations.of(context)?.writeDescription ?? '';
  static String areYouSureYouWantToDeleteTheEntireTextField =
      AppLocalizations.of(context)
              ?.areYouSureYouWantToDeleteTheEntireTextField ??
          '';
  static String addCaption = AppLocalizations.of(context)?.addCaption ?? '';
  static String addDescription =
      AppLocalizations.of(context)?.addDescription ?? '';
  static String writeSomething =
      AppLocalizations.of(context)?.writeSomething ?? '';
  static String text = AppLocalizations.of(context)?.text ?? '';
  static String campaignBuilder =
      AppLocalizations.of(context)?.campaignBuilder ?? '';
  static String areYouSureYouWantToStopBuildingThisCampaign =
      AppLocalizations.of(context)
              ?.areYouSureYouWantToStopBuildingThisCampaign ??
          '';

  ///IMAGE BUILDER
  static String tapToAddPhoto =
      AppLocalizations.of(context)?.tapToAddPhoto ?? '';
  static String hide = AppLocalizations.of(context)?.hide ?? '';
  static String albums = AppLocalizations.of(context)?.albums ?? '';
  static String photos = AppLocalizations.of(context)?.photos ?? '';

  ///PROFILE
  static String editProfile = AppLocalizations.of(context)?.editProfile ?? '';
  static String preferences = AppLocalizations.of(context)?.preferences ?? '';
  static String language = AppLocalizations.of(context)?.language ?? '';
  static String english = AppLocalizations.of(context)?.english ?? '';
  static String payment = AppLocalizations.of(context)?.payment ?? '';
  static String socials = AppLocalizations.of(context)?.socials ?? '';
  static String twitter = AppLocalizations.of(context)?.twitter ?? '';
  static String instagram = AppLocalizations.of(context)?.instagram ?? '';
  static String venmo = AppLocalizations.of(context)?.venmo ?? '';
  static String connected = AppLocalizations.of(context)?.connected ?? '';
  static String notConnected = AppLocalizations.of(context)?.notConnected ?? '';

  ///FEEDBACKS
  static String pleaseIncludeAKeywordInYourSearch =
      AppLocalizations.of(context)?.pleaseIncludeAKeywordInYourSearch ?? '';
  static String noRefreshTokenFound =
      AppLocalizations.of(context)?.noRefreshTokenFound ?? '';
  static String somethingWentWrong =
      AppLocalizations.of(context)?.somethingWentWrong ?? '';
  static String youAreNotAuthenticated =
      AppLocalizations.of(context)?.youAreNotAuthenticated ?? '';
  static String youDoNotHaveAccessToThisResource =
      AppLocalizations.of(context)?.youDoNotHaveAccessToThisResource ?? '';
  static String thisResourceWasNotFound =
      AppLocalizations.of(context)?.thisResourceWasNotFound ?? '';
  static String aServerErrorOccurred =
      AppLocalizations.of(context)?.aServerErrorOccurred ?? '';
  static String anErrorOccurred =
      AppLocalizations.of(context)?.anErrorOccurred ?? '';
  static String errorSavingThisContact =
      AppLocalizations.of(context)?.errorSavingThisContact ?? '';
  static String contactSavedSuccessfully =
      AppLocalizations.of(context)?.contactSavedSuccessfully ?? '';
}
