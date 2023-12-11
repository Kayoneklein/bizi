part of '../index.dart';

class Campaigns extends StatelessWidget {
  const Campaigns({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BiziAppWrapper(
      useScaffold: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10, top: 20),
          child: Column(
            children: [
              BiziTextField(
                hintText: TextLocalization.search,
                filled: true,
                filledColor: BColors.lightGrey,
                hintStyle:
                    theme.textTheme.bodyMedium?.copyWith(color: BColors.black),
                prefixIcon: const Icon(Icons.search),
              ),
              const VerticalSpace(10),
              const CampaignListCard(
                image: BImages.campaign1,
                title: 'Campaign 1',
                subtitle: 'Lorem ipsum',
              ),
              const CampaignListCard(
                image: BImages.campaign2,
                title: 'Campaign 2',
                subtitle: 'Lorem ipsum',
              ),
              const CampaignListCard(
                image: BImages.campaign3,
                title: 'Campaign 3',
                subtitle: 'Lorem ipsum',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
