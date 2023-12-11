import 'package:bizi/redux/states/campaign_builder.dart';
import 'package:bizi/redux/states/global_app_properties_state.dart';
import 'package:bizi/redux/states/home_screen_state.dart';
import 'package:bizi/redux/states/user_state.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AppState {
  final CampaignBuilderState campaignBuilderState;
  final HomeScreenState homeScreenState;
  final GlobalAppPropertiesState globalAppPropertiesState;
  final UserState userState;

  const AppState({
    required this.campaignBuilderState,
    required this.homeScreenState,
    required this.globalAppPropertiesState,
    required this.userState,
  });

  factory AppState.initial() {
    return AppState(
      campaignBuilderState: CampaignBuilderState.initial(),
      homeScreenState: HomeScreenState.initial(),
      globalAppPropertiesState: GlobalAppPropertiesState.initial(),
      userState: UserState.initial(),
    );
  }

  AppState copyWith({
    CampaignBuilderState? campaignBuilderState,
    HomeScreenState? homeScreenState,
    GlobalAppPropertiesState? globalAppPropertiesState,
    UserState? userState,
  }) {
    return AppState(
      campaignBuilderState: campaignBuilderState ?? this.campaignBuilderState,
      homeScreenState: homeScreenState ?? this.homeScreenState,
      globalAppPropertiesState:
          globalAppPropertiesState ?? this.globalAppPropertiesState,
      userState: userState ?? this.userState,
    );
  }

  static AppState fromJson(dynamic json) {
    try {
      return AppState(
        campaignBuilderState:
            CampaignBuilderState.fromJson(json['campaignBuilderState']),
        homeScreenState: HomeScreenState.fromJson(json['homeScreenState']),
        globalAppPropertiesState:
            GlobalAppPropertiesState.fromJson(json['globalAppPropertiesState']),
        userState: UserState.fromJson(json['userState']),
      );
    } catch (e) {
      return AppState.initial();
    }
  }

  dynamic toJson() {
    return {
      'campaignBuilderState': campaignBuilderState.toJson(),
      'homeScreenState': homeScreenState.toJson(),
      'globalAppPropertiesState': globalAppPropertiesState.toJson(),
      'userState': userState.toJson(),
    };
  }
}
