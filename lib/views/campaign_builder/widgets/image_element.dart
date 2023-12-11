part of '../index.dart';

class ImageElement extends StatelessWidget {
  const ImageElement({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return StoreConnector<AppState, CampaignBuilderViewModel>(
      converter: (store) => CampaignBuilderViewModel.fromStore(store),
      builder: (_, pageModel) {
        int index = pageModel.campaignModel.activeEditItem?.index ?? 1;
        return Card(
          margin: EdgeInsets.zero,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ImageRowSelect(
                  image: pageModel.campaignModel.rows[index].image,
                ),
                TextButton(
                  onPressed: () {
                    pageModel.setActiveEditItem(index, RowProperty.subtitle);
                    showModalBottomSheet(
                      elevation: 5,
                      backgroundColor: BColors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (ctx) {
                        ///TODO: This section will be uncommented after PRs 13-15 is merged
                        return Container();
                        // return TextBottomSheet(
                        //   text: pageModel.campaignModel.rows[index].subtitle ??
                        //       '',
                        //   editText: (String title) {
                        //     pageModel.editRowSubtitle(title, index);
                        //   },
                        // );
                      },
                    );
                  },
                  child: CustomText(
                    ///TODO: This section will be uncommented after PRs 13-15 is merged
                    text: 'TextLocalization.addCaption',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: BColors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
