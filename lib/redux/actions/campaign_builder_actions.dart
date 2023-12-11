import 'package:bizi/models/create_campaign_model.dart';
import 'package:bizi/models/photo_model.dart';
import 'package:bizi/redux/states/campaign_builder.dart';

class ToggleMediaOverlay {
  final bool showMediaOverlay;

  const ToggleMediaOverlay(this.showMediaOverlay);
}

class ToggleTextEditPanel {
  final bool showTextEditPanel;

  const ToggleTextEditPanel(this.showTextEditPanel);
}

class CampaignEdited {}

class ToggleButtonEditPanel {
  final bool showButtonEditPanel;

  const ToggleButtonEditPanel(this.showButtonEditPanel);
}

class GetPexelsPhotos {
  final bool isSearch;
  final int page;
  final String? query;

  const GetPexelsPhotos({
    this.isSearch = false,
    this.page = 1,
    this.query,
  });
}

class GetUnsplashPhotos {
  final bool isSearch;
  final int page;
  final String? query;
  const GetUnsplashPhotos({
    this.isSearch = false,
    this.page = 1,
    this.query,
  });
}

class SetPexelsPhotos {
  final List<PhotoModel> photos;

  const SetPexelsPhotos(this.photos);
}

class SetUnsplashPhotos {
  final List<PhotoModel> photos;

  const SetUnsplashPhotos(this.photos);
}

class SetImageBuilderDisplayType {
  final ImageBuilderDisplayType imageBuilderDisplayTYpe;
  const SetImageBuilderDisplayType(this.imageBuilderDisplayTYpe);
}

class UpdateCampaignRows {
  final List<CampaignRow> rows;

  const UpdateCampaignRows(this.rows);
}

class UpdateActiveEditRowItem {
  final ActiveEditRowItem item;

  const UpdateActiveEditRowItem(this.item);
}

class LeaveCampaignBuilder {}

class ResetCampaignBuilderState {}
