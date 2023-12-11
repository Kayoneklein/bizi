part of '../index.dart';

enum EditButtonStage { text, link, color, placement }

class CampaignBuilderViewModel {
  final bool showMediaOverlay;
  final bool showTextEditPanel;
  final bool showButtonEditPanel;
  final bool hasEditedCampaign;
  final Function toggleMediaCard;
  final Function(bool?) toggleTextEditPanel;
  final Function onClickImageCard;
  final List<PhotoModel> pexelsPhotos;
  final List<PhotoModel> unsplashPhotos;
  final ImageBuilderDisplayType imageBuilderDisplay;
  final CreateCampaignModel campaignModel;
  final Function(ImageBuilderDisplayType type) changeImageDisplayType;
  final Function(String) searchPexelImages;
  final Function(String) searchUnsplashImages;
  final Function(ButtonActionModel) editCampaignButton;
  final Function(String, int) editRowSubtitle;
  final Function(String, int) editRowDescription;
  final Function(RowProperty, int) deleteRowProperty;
  final Function(int) imageCardClicked;
  final Function(int, RowImage) selectRowPhoto;
  final Function addCampaignRow;
  final Function(int, RowProperty) setActiveEditItem;
  final Function(bool) toggleButtonEditPanel;
  final Function addButtonRow;
  final Function resetCampaign;

  const CampaignBuilderViewModel({
    required this.showMediaOverlay,
    required this.showTextEditPanel,
    required this.showButtonEditPanel,
    required this.toggleMediaCard,
    required this.toggleTextEditPanel,
    required this.pexelsPhotos,
    required this.onClickImageCard,
    required this.unsplashPhotos,
    required this.imageBuilderDisplay,
    required this.changeImageDisplayType,
    required this.searchPexelImages,
    required this.searchUnsplashImages,
    required this.editCampaignButton,
    required this.campaignModel,
    required this.editRowSubtitle,
    required this.editRowDescription,
    required this.deleteRowProperty,
    required this.imageCardClicked,
    required this.selectRowPhoto,
    required this.addCampaignRow,
    required this.setActiveEditItem,
    required this.toggleButtonEditPanel,
    required this.addButtonRow,
    required this.hasEditedCampaign,
    required this.resetCampaign,
  });

  static CampaignBuilderViewModel fromStore(Store<AppState> store) {
    return CampaignBuilderViewModel(
      showMediaOverlay: store.state.campaignBuilderState.showMediaOverlay,
      showTextEditPanel: store.state.campaignBuilderState.showTextEditPanel,
      showButtonEditPanel: store.state.campaignBuilderState.showButtonEditPanel,
      hasEditedCampaign: store.state.campaignBuilderState.hasEditedCampaign,
      toggleMediaCard: () {
        store.dispatch(
          ToggleMediaOverlay(
              !store.state.campaignBuilderState.showMediaOverlay),
        );
      },
      toggleTextEditPanel: (bool? showTextEdit) {
        store.dispatch(
          ToggleTextEditPanel(
            showTextEdit ?? !store.state.campaignBuilderState.showTextEditPanel,
          ),
        );
      },
      toggleButtonEditPanel: (bool showButtonPanel) {
        store.dispatch(ToggleButtonEditPanel(showButtonPanel));
      },
      pexelsPhotos: store.state.campaignBuilderState.pexelsPhotos,
      addCampaignRow: () => _addCampaignRow(store: store, isFullRow: true),
      addButtonRow: () {
        ButtonActionModel button = CreateCampaignModel.defaultButton();
        _addCampaignRow(store: store, button: button);
      },
      onClickImageCard: () {
        RowImage img = const RowImage();
        _addCampaignRow(store: store, image: img);
        store.dispatch(const GetPexelsPhotos());
      },
      unsplashPhotos: store.state.campaignBuilderState.unsplashPhotos,
      imageBuilderDisplay: store.state.campaignBuilderState.imageBuilderDisplay,
      changeImageDisplayType: (ImageBuilderDisplayType type) {
        if (type == ImageBuilderDisplayType.pexels) {
          store.dispatch(const GetPexelsPhotos());
        } else if (type == ImageBuilderDisplayType.unsplash) {
          store.dispatch(const GetUnsplashPhotos());
        } else if (type == ImageBuilderDisplayType.giphy) {
        } else if (type == ImageBuilderDisplayType.device) {}
        store.dispatch(SetImageBuilderDisplayType(type));
      },
      searchPexelImages: (String query) => store.dispatch(
        GetPexelsPhotos(isSearch: true, query: query),
      ),
      searchUnsplashImages: (String query) => store.dispatch(
        GetUnsplashPhotos(isSearch: true, query: query),
      ),
      editCampaignButton: (
        ButtonActionModel button,
      ) {
        final int index = store
            .state.campaignBuilderState.campaignModel.activeEditItem!.index;

        _editCampaignRowParam(store: store, index: index, button: button);
      },
      campaignModel: store.state.campaignBuilderState.campaignModel,
      editRowSubtitle: (String subtitle, int index) {
        _editCampaignRowParam(store: store, index: index, subtitle: subtitle);
      },
      editRowDescription: (String description, int index) {
        _editCampaignRowParam(
            store: store, index: index, description: description);
      },
      deleteRowProperty: (RowProperty property, int index) {
        _deleteRowProperty(store: store, index: index, property: property);
      },
      imageCardClicked: (int index) {
        OverlayService.showOverlay(
          top: 50,
          left: 20,
          right: 20,
          child: CampaignImageBuilder(index: index),
          store: store,
        );
        _setActiveRowItem(store, index, RowProperty.image);
      },
      selectRowPhoto: (int index, RowImage image) {
        _editCampaignRowParam(store: store, index: index, image: image);
      },
      setActiveEditItem: (int index, RowProperty property) {
        _setActiveRowItem(store, index, property);
      },
      resetCampaign: () {
        store.dispatch(ResetCampaignBuilderState());
      },
    );
  }

  static void _editCampaignRowParam({
    required Store<AppState> store,
    required int index,
    String? subtitle,
    String? description,
    RowImage? image,
    ButtonActionModel? button,
  }) {
    List<CampaignRow> oldRows =
        store.state.campaignBuilderState.campaignModel.rows;
    CampaignRow row = oldRows[index];
    CampaignRow? newRow;
    if (subtitle != null) {
      newRow = row.copyWith(subtitle: subtitle);
    }
    if (description != null) {
      newRow = row.copyWith(description: description);
    }
    if (image != null) {
      newRow = row.copyWith(image: image);
    }

    if (button != null) {
      newRow = row.copyWith(button: button);
    }

    List<CampaignRow> rows = [];
    for (int i = 0; i < oldRows.length; i++) {
      if (i == index) {
        rows.add(newRow!);
      } else {
        rows.add(oldRows[i]);
      }
    }

    store.dispatch(UpdateCampaignRows(rows));
  }

  static void _addCampaignRow({
    required Store<AppState> store,
    RowImage? image,
    String? subtitle,
    String? description,
    String? audioUrl,
    String? videoUrl,
    ButtonActionModel? button,
    bool isFullRow = false,
  }) {
    List<CampaignRow> oldRows =
        store.state.campaignBuilderState.campaignModel.rows;

    CampaignRow newRow;
    if (isFullRow) {
      newRow = CreateCampaignModel.defaultRow(true);
    } else {
      newRow = CampaignRow(
        image: image,
        subtitle: subtitle,
        description: description,
        audioUrl: audioUrl,
        videoUrl: videoUrl,
        button: button,
      );
    }

    List<CampaignRow> newRows = [...oldRows, newRow];
    store.dispatch(UpdateCampaignRows(newRows));
  }

  static void _deleteRowProperty({
    required Store<AppState> store,
    required int index,
    required RowProperty property,
  }) {
    List<CampaignRow> oldRows =
        store.state.campaignBuilderState.campaignModel.rows;
    CampaignRow row = oldRows[index];

    CampaignRow newRow = row.deleteProperty(property);

    Map<String, dynamic> newRowMap = newRow.toJson();
    newRowMap.removeWhere((key, value) => value == null);
    if (newRowMap.isEmpty) {
      _removeRow(store: store, index: index);
      return;
    }

    List<CampaignRow> rows = [];
    for (int i = 0; i < oldRows.length; i++) {
      if (i == index) {
        rows.add(newRow);
      } else {
        rows.add(oldRows[i]);
      }
    }

    store.dispatch(UpdateCampaignRows(rows));
  }

  static void _removeRow({
    required Store<AppState> store,
    required int index,
  }) {
    List<CampaignRow> rows =
        store.state.campaignBuilderState.campaignModel.rows;

    rows.remove(rows[index]);

    store.dispatch(UpdateCampaignRows(rows));
  }

  static _setActiveRowItem(
      Store<AppState> store, int index, RowProperty property) {
    ActiveEditRowItem item = ActiveEditRowItem(
      index: index,
      property: property,
    );
    store.dispatch(UpdateActiveEditRowItem(item));
  }
}
