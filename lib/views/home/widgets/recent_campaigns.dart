part of '../index.dart';

class RecentCampaigns extends StatelessWidget {
  const RecentCampaigns({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: TextLocalization.mostRecentCampaigns,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: BColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const VerticalSpace(15),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.28,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CampaignCard(
                image: BImages.homeCampaign1,
                title: 'If the Ryle Raiders win, you win!',
              ),
              CampaignCard(
                image: BImages.homeCampaign2,
                title: 'Sign the Tappshare NDA',
              ),
            ],
          ),
        ),
        const VerticalSpace(23),
      ],
    );
  }
}
