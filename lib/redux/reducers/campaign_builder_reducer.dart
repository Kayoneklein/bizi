import 'package:bizi/models/create_campaign_model.dart';
import 'package:bizi/redux/actions/campaign_builder_actions.dart';
import 'package:bizi/redux/states/campaign_builder.dart';
import 'package:redux/redux.dart';

final campaignBuilderReducer = combineReducers<CampaignBuilderState>([
  TypedReducer<CampaignBuilderState, ToggleMediaOverlay>(_toggleMediaState)
      .call,
  TypedReducer<CampaignBuilderState, SetPexelsPhotos>(_setPexelsPhotos).call,
  TypedReducer<CampaignBuilderState, SetUnsplashPhotos>(_setUnsplashPhotos)
      .call,
  TypedReducer<CampaignBuilderState, SetImageBuilderDisplayType>(
          _setImageBuilderDisplayTYpe)
      .call,
  TypedReducer<CampaignBuilderState, UpdateCampaignRows>(_updateCampaignRows)
      .call,
  TypedReducer<CampaignBuilderState, UpdateActiveEditRowItem>(
          _updateActiveEditRowItem)
      .call,
  TypedReducer<CampaignBuilderState, ToggleTextEditPanel>(_toggleTextEditPanel)
      .call,
  TypedReducer<CampaignBuilderState, ToggleButtonEditPanel>(
          _toggleButtonEditPanel)
      .call,
  TypedReducer<CampaignBuilderState, CampaignEdited>(_campaignEdited).call,
  TypedReducer<CampaignBuilderState, ResetCampaignBuilderState>(_resetState)
      .call,
]);

CampaignBuilderState _toggleMediaState(
    CampaignBuilderState state, ToggleMediaOverlay action) {
  return state.copyWith(showMediaOverlay: action.showMediaOverlay);
}

CampaignBuilderState _setPexelsPhotos(
    CampaignBuilderState state, SetPexelsPhotos action) {
  return state.copyWith(pexelsPhotos: action.photos);
}

CampaignBuilderState _setUnsplashPhotos(
    CampaignBuilderState state, SetUnsplashPhotos action) {
  return state.copyWith(unsplashPhotos: action.photos);
}

CampaignBuilderState _setImageBuilderDisplayTYpe(
    CampaignBuilderState state, SetImageBuilderDisplayType action) {
  return state.copyWith(imageBuilderDisplay: action.imageBuilderDisplayTYpe);
}

CampaignBuilderState _updateCampaignRows(
    CampaignBuilderState state, UpdateCampaignRows action) {
  CreateCampaignModel model = state.campaignModel.copyWith(rows: action.rows);

  return state.copyWith(campaignModel: model, hasEditedCampaign: true);
}

CampaignBuilderState _updateActiveEditRowItem(
    CampaignBuilderState state, UpdateActiveEditRowItem action) {
  CreateCampaignModel campaignModel =
      state.campaignModel.copyWith(activeEditItem: action.item);
  return state.copyWith(campaignModel: campaignModel);
}

CampaignBuilderState _toggleTextEditPanel(
    CampaignBuilderState state, ToggleTextEditPanel action) {
  return state.copyWith(showTextEditPanel: action.showTextEditPanel);
}

CampaignBuilderState _toggleButtonEditPanel(
    CampaignBuilderState state, ToggleButtonEditPanel action) {
  return state.copyWith(showButtonEditPanel: action.showButtonEditPanel);
}

CampaignBuilderState _campaignEdited(
    CampaignBuilderState state, CampaignEdited action) {
  return state.copyWith(hasEditedCampaign: true);
}

CampaignBuilderState _resetState(
    CampaignBuilderState state, ResetCampaignBuilderState action) {
  return CampaignBuilderState.initial();
}
