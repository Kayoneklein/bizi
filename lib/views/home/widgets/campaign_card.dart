part of '../index.dart';

class CampaignCard extends StatelessWidget {
  final String image;
  final String title;
  const CampaignCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return StoreConnector<AppState, OverlayModel>(
      converter: (Store<AppState> store) => OverlayModel.fromStore(store),
      builder: (_, pageModel) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30.0,
                    right: 15,
                    left: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 153,
                        child: CustomText(
                          text: title,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: BColors.white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTapDown: (TapDownDetails details) {
                          double dx = details.globalPosition.dx;
                          double dy = details.globalPosition.dy;
                          const double width = 122;
                          const double height = 112;
                          pageModel.toggleOverlay(
                            left: dx - width - 10,
                            top: dy - height - 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 18),
                                width: width,
                                height: height,
                                color: Colors.black.withOpacity(0.3),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Button(
                                        onPressed: () {
                                          String url = 'https://google.com';
                                          Share.share(url);
                                        },
                                        text: TextLocalization.share,
                                        color: BColors.white,
                                      ),
                                      Button(
                                        onPressed: () {},
                                        text: TextLocalization.edit,
                                        color: BColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.more_vert_rounded,
                          color: BColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              right: 20,
              top: 18,
              child: Icon(
                Icons.qr_code_scanner_outlined,
                color: BColors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
