part of '../index.dart';

class CampaignBottomNav extends StatelessWidget {
  final CampaignBuilderViewModel pageModel;
  const CampaignBottomNav({super.key, required this.pageModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LeaveCampaignBuilderButton(
          hasEditedCampaign: pageModel.hasEditedCampaign,
          resetBuilderState: pageModel.resetCampaign,
        ),
        CustomText(
          text: TextLocalization.campaignBuilder,
          textAlign: TextAlign.left,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                BIcons.undo,
                color: BColors.grey,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                BIcons.redo,
                color: BColors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
