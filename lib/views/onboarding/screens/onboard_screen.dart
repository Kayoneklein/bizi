part of '../index.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BiziAppWrapper(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 40, top: 20),
                child: LanguageSelect(),
              ),
            ),
            Image.asset(
              BImages.handSpeaker,
              height: MediaQuery.of(context).size.height * 0.38,
            ),
            const VerticalSpace(82),
            CustomText(
              text: TextLocalization.creatingACampaign,
              style: theme.textTheme.headlineSmall,
            ),
            const VerticalSpace(38),
            CustomText(
              text: TextLocalization.hereIsASimple,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(50),
            BottomActionButtons(setState: () {}),
          ],
        ),
      ),
    );
  }
}
