part of '../index.dart';

class HomeContents extends StatelessWidget {
  const HomeContents({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeScreenModel>(
      converter: (store) => HomeScreenModel.fromStore(store),
      builder: (_, pageModel) {
        return BiziAppWrapper(
          useScaffold: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),
                  AnalyticsSection(pageModel: pageModel),
                  const RecentCampaigns(),
                  BusinessCardSection(pageModel: pageModel),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
