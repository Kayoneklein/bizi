part of '../index.dart';

class SearchOverlayCard extends StatelessWidget {
  final OverlayState overlayState;
  const SearchOverlayCard({
    super.key,
    required this.overlayState,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OverlayModel>(
        converter: (Store<AppState> store) => OverlayModel.fromStore(store),
        builder: (_, pageModel) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.search,
                      size: 27,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: TextLocalization.searchACampaign,
                            prefixIcon: const Icon(Icons.search)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (pageModel.overlayActive) {
                          pageModel.disableOverlay();
                        }
                      },
                      child: const CustomText(text: 'X'),
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        BImages.campaign1,
                        width: 44,
                        height: 41,
                      ),
                      title: const CustomText(
                        text: 'Campaign 1',
                      ),
                      subtitle: const CustomText(
                        text: 'Lorem ipsum',
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 10,
                        color: BColors.blue,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        BImages.campaign2,
                        width: 44,
                        height: 41,
                      ),
                      title: const CustomText(
                        text: 'Campaign 2',
                      ),
                      subtitle: const CustomText(
                        text: 'Lorem ipsum',
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 10,
                        color: BColors.blue,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        BImages.campaign3,
                        width: 44,
                        height: 41,
                      ),
                      title: const CustomText(
                        text: 'Campaign 3',
                      ),
                      subtitle: const CustomText(
                        text: 'Lorem ipsum',
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 10,
                        color: BColors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
