part of '../index.dart';

class ElementBox extends StatelessWidget {
  const ElementBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      elevation: 4,
      // color: BColors.lightGrey,
      type: MaterialType.card,
      child: SizedBox(
        width: size.width * 1.2,
        height: size.height * 0.145,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CampaignDetailOption(
              icon: BIcons.info,
              option: TextLocalization.info.toUpperCase(),
              onTap: () {
                // pageModel.addCampaignRow();
                // pageModel.toggleMediaCard();
              },
            ),
            CampaignDetailOption(
              icon: BIcons.image,
              option: TextLocalization.image.toUpperCase(),
              onTap: () {
                // pageModel.onClickImageCard();
                // pageModel.toggleMediaCard();
              },
            ),
            CampaignDetailOption(
              icon: BIcons.button,
              option: TextLocalization.button.toUpperCase(),
              onTap: () {
                // pageModel.addButtonRow();
                // pageModel.toggleMediaCard();
              },
            ),
            CampaignDetailOption(
              icon: Icons.play_circle_outline_outlined,
              option: TextLocalization.video.toUpperCase(),
              onTap: () {},
            ),
            CampaignDetailOption(
              icon: Icons.volume_up_outlined,
              option: TextLocalization.audio.toUpperCase(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
