import 'package:bizi/models/create_campaign_model.dart';
import 'package:bizi/models/photo_model.dart';
import 'package:bizi/utils/converter.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

enum ImageBuilderDisplayType { device, pexels, unsplash, giphy }

@immutable
class CampaignBuilderState {
  final bool showMediaOverlay;
  final bool showTextEditPanel;
  final bool showButtonEditPanel;
  final bool hasEditedCampaign;

  final List<PhotoModel> pexelsPhotos;
  final List<PhotoModel> unsplashPhotos;
  final ImageBuilderDisplayType imageBuilderDisplay;
  final CreateCampaignModel campaignModel;

  const CampaignBuilderState({
    required this.showMediaOverlay,
    required this.showTextEditPanel,
    required this.pexelsPhotos,
    required this.unsplashPhotos,
    required this.imageBuilderDisplay,
    required this.campaignModel,
    required this.showButtonEditPanel,
    required this.hasEditedCampaign,
  });

  factory CampaignBuilderState.initial() {
    return CampaignBuilderState(
      showMediaOverlay: false,
      showTextEditPanel: false,
      hasEditedCampaign: false,
      showButtonEditPanel: false,
      pexelsPhotos: const [],
      unsplashPhotos: const [],
      imageBuilderDisplay: ImageBuilderDisplayType.pexels,
      campaignModel: CreateCampaignModel.initial(),
    );
  }

  CampaignBuilderState copyWith({
    bool? showMediaOverlay,
    bool? showTextEditPanel,
    bool? showButtonEditPanel,
    bool? hasEditedCampaign,
    List<PhotoModel>? pexelsPhotos,
    List<PhotoModel>? unsplashPhotos,
    ImageBuilderDisplayType? imageBuilderDisplay,
    CreateCampaignModel? campaignModel,
  }) {
    return CampaignBuilderState(
      showMediaOverlay: showMediaOverlay ?? this.showMediaOverlay,
      showTextEditPanel: showTextEditPanel ?? this.showTextEditPanel,
      showButtonEditPanel: showButtonEditPanel ?? this.showButtonEditPanel,
      hasEditedCampaign: hasEditedCampaign ?? this.hasEditedCampaign,
      pexelsPhotos: pexelsPhotos ?? this.pexelsPhotos,
      unsplashPhotos: unsplashPhotos ?? this.unsplashPhotos,
      imageBuilderDisplay: imageBuilderDisplay ?? this.imageBuilderDisplay,
      campaignModel: campaignModel ?? this.campaignModel,
    );
  }

  static CampaignBuilderState fromJson(dynamic json) {
    try {
      return CampaignBuilderState(
        showMediaOverlay: json['showMediaOverlay'],
        showTextEditPanel: json['showTextEditPanel'],
        hasEditedCampaign: json['hasEditedCampaign'],
        showButtonEditPanel: json['showButtonEditPanel'],
        pexelsPhotos:
            convertListDynamicToListPhotoModel(json['pexelsPhotos'] ?? []),
        unsplashPhotos:
            convertListDynamicToListPhotoModel(json['unsplashPhotos'] ?? []),
        imageBuilderDisplay:
            convertStringToImageBuilderEnum(json['imageBuilderDisplay']),
        campaignModel: CreateCampaignModel.fromJson(json['campaignModel']),
      );
    } catch (e) {
      developer.log("CampaignBuilderState fromJson error ${e.toString()}");
      return CampaignBuilderState.initial();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'showMediaOverlay': showMediaOverlay,
      'showTextEditPanel': showTextEditPanel,
      'showButtonEditPanel': showButtonEditPanel,
      'hasEditedCampaign': hasEditedCampaign,
      'pexelsPhotos': pexelsPhotos.map((photo) => photo.toJson()).toList(),
      'unsplashPhotos': unsplashPhotos.map((photo) => photo.toJson()).toList(),
      'imageBuilderDisplay': imageBuilderDisplay.toString(),
      'campaignModel': campaignModel.toJson(),
    };
  }
}
