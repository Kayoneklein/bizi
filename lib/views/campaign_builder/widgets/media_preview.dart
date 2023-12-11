part of '../index.dart';

class MediaPreview extends StatelessWidget {
  final Function hideOverlay;
  final RowImage? image;
  const MediaPreview({
    super.key,
    required this.hideOverlay,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ImageRowSelect(image: image),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              hideOverlay();
            },
            child: Container(
              width: 109,
              height: 41,
              decoration: BoxDecoration(
                color: BColors.veryLightGrey,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: TextLocalization.hide,
                    style:
                        theme.textTheme.headlineSmall?.copyWith(fontSize: 18),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: BColors.grey,
                  )
                ],
              ),
            ),
          ),
        ),
        const VerticalSpace(10),
      ],
    );
  }
}
