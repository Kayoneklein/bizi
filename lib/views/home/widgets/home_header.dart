part of '../index.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    OverlayState? overlayState = Overlay.of(context);
    final theme = Theme.of(context);

    return StoreConnector<AppState, OverlayModel>(
        converter: (Store<AppState> store) => OverlayModel.fromStore(store),
        builder: (_, pageModel) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: TextLocalization.welcome,
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                  ),
                  CustomText(
                    text: 'David Cain',
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  pageModel.toggleOverlay(
                    top: 30,
                    right: 20,
                    left: 20,
                    child: SearchOverlayCard(overlayState: overlayState),
                  );
                },
                child: const Icon(
                  Icons.search,
                  size: 27,
                ),
              ),
            ],
          );
        });
  }
}
