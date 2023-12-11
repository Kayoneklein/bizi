part of '../index.dart';

class CampaignBuilder extends StatefulWidget {
  const CampaignBuilder({super.key});

  @override
  State<CampaignBuilder> createState() => _CampaignBuilderState();
}

class _CampaignBuilderState extends State<CampaignBuilder> {
  ButtonActionLinkModel? linkType;
  final linkFormKey = GlobalKey<FormState>();
  final TextEditingController linkController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CampaignBuilderViewModel>(
      converter: (store) => CampaignBuilderViewModel.fromStore(store),
      builder: (_, pageModel) {
        return BiziAppWrapper(
          resizeToAvoidBottomInset: false,
          backgroundColor: BColors.white.withOpacity(0.98),
          pageFunction: () {
            if (pageModel.showMediaOverlay) {
              pageModel.toggleMediaCard();
            }
            if (pageModel.showTextEditPanel) {
              pageModel.toggleTextEditPanel(false);
            }
          },
          body: Column(
            children: [
              const Expanded(child: CampaignRowItems()),
              const ElementBox(),
              BottomAppBar(
                child: CampaignBottomNav(pageModel: pageModel),
              ),
            ],
          ),
        );
      },
    );
  }
}
