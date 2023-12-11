part of '../index.dart';

class CampaignRowItems extends StatelessWidget {
  const CampaignRowItems({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return StoreConnector<AppState, CampaignBuilderViewModel>(
      converter: (store) => CampaignBuilderViewModel.fromStore(store),
      builder: (_, pageModel) {
        return ListView.builder(
          itemCount: pageModel.campaignModel.rows.length,
          padding: EdgeInsets.zero,
          itemBuilder: (_, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Card(
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
                              return TextBottomSheet(
                                text: '',
                                editText: (v) {},
                              );
                            },
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: TextLocalization.addCaption,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: BColors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(4, -2),
                                  child: CustomText(
                                    text: '*',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: BColors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
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
                              return TextBottomSheet(
                                text: '',
                                editText: (v) {},
                              );
                            },
                          );
                        },
                        child: CustomText(
                          text: TextLocalization.addDescription,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: BColors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        iconSize: 48,
                        onPressed: () {
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
                              return SizedBox(
                                height: size.height * 0.2,
                                child: const Column(
                                  children: [],
                                ),
                              );
                            },
                          );
                        },
                        icon: Image.asset(
                          BIcons.addBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
