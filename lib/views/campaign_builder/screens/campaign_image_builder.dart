part of '../index.dart';

class CampaignImageBuilder extends StatelessWidget {
  final int index;
  const CampaignImageBuilder({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: StoreConnector<AppState, CampaignBuilderViewModel>(
            converter: (Store<AppState> store) =>
                CampaignBuilderViewModel.fromStore(store),
            builder: (_, pageModel) {
              return Column(
                children: [
                  MediaPreview(
                    hideOverlay: () => pageModel.imageCardClicked(index),
                    image: pageModel.campaignModel.rows[index].image,
                  ),
                  ImageTabsDisplay(rowIndex: index),
                ],
              );
            }),
      ),
    );
  }
}
