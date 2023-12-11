part of '../index.dart';

class ImageTabsDisplay extends StatelessWidget {
  final int rowIndex;
  const ImageTabsDisplay({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CampaignBuilderViewModel>(
      converter: (Store<AppState> store) =>
          CampaignBuilderViewModel.fromStore(store),
      builder: (_, pageModel) {
        return Container(
          decoration: const BoxDecoration(
            color: BColors.veryLightGrey,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImageOptionButton(
                      onTap: () {
                        pageModel.changeImageDisplayType(
                            ImageBuilderDisplayType.device);
                      },
                      icon: BIcons.add,
                      isActive: pageModel.imageBuilderDisplay ==
                          ImageBuilderDisplayType.device,
                    ),
                    ImageOptionButton(
                      onTap: () {
                        pageModel.changeImageDisplayType(
                            ImageBuilderDisplayType.pexels);
                      },
                      icon: BIcons.pexels,
                      isActive: pageModel.imageBuilderDisplay ==
                          ImageBuilderDisplayType.pexels,
                      height: 28,
                    ),
                    ImageOptionButton(
                      onTap: () {
                        pageModel.changeImageDisplayType(
                            ImageBuilderDisplayType.unsplash);
                      },
                      icon: BIcons.unsplash,
                      isActive: pageModel.imageBuilderDisplay ==
                          ImageBuilderDisplayType.unsplash,
                      height: 16,
                    ),
                    ImageOptionButton(
                      onTap: () {
                        pageModel.changeImageDisplayType(
                            ImageBuilderDisplayType.giphy);
                      },
                      icon: BIcons.giphy,
                      isActive: pageModel.imageBuilderDisplay ==
                          ImageBuilderDisplayType.giphy,
                      height: 15,
                    ),
                  ],
                ),
                const Divider(color: BColors.grey, thickness: 0.5),
                if (pageModel.imageBuilderDisplay ==
                        ImageBuilderDisplayType.pexels ||
                    pageModel.imageBuilderDisplay ==
                        ImageBuilderDisplayType.unsplash)
                  ImageSearchField(pageModel: pageModel),
                Column(
                  children: [
                    if (pageModel.imageBuilderDisplay ==
                        ImageBuilderDisplayType.device)
                      GalleryView(
                        rowIndex: rowIndex,
                        selectRowPhoto: (int index, RowImage image) =>
                            pageModel.selectRowPhoto(index, image),
                      ),

                    if (pageModel.imageBuilderDisplay ==
                        ImageBuilderDisplayType.pexels)
                      PexelsImageDisplay(
                        pexelsPhotos: pageModel.pexelsPhotos,
                        rowIndex: rowIndex,
                        selectRowPhoto: (int index, RowImage image) =>
                            pageModel.selectRowPhoto(index, image),
                      ),

                    if (pageModel.imageBuilderDisplay ==
                        ImageBuilderDisplayType.unsplash)
                      UnsplashImageDisplay(
                        photos: pageModel.unsplashPhotos,
                        rowIndex: rowIndex,
                        selectRowPhoto: (int index, RowImage image) =>
                            pageModel.selectRowPhoto(index, image),
                      ),

                    //TODO: work on styling giphy images properly
                    if (pageModel.imageBuilderDisplay ==
                        ImageBuilderDisplayType.giphy)
                      const GiphyImageDisplay(),
                    // photos[index].urls.thumb.toString(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
