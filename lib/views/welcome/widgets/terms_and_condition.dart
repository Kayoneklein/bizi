part of '../index.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CustomText(
                text: TextLocalization.termsAndConditionCase,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            CustomText(
              text: 'Lorem ipsum dolor sit amet, consectetur'
                  ' adipiscing elit. Donec augue massa,'
                  ' commodo a faucibus at, consequat '
                  'pulvinar lorem. Proin sagittis metus'
                  ' lorem, eget dapibus elit fermentum '
                  'vel. Aliquam erat volutpat. Donec a '
                  'consequat nulla, sit amet porttitor mauris. '
                  'Sed dui quam, volutpat vel suscipit sed, '
                  'consequat quis elit. Vivamus ac nunc ut '
                  'eros mollis laoreet. Curabitur ullamcorper, '
                  'tortor id imperdiet mollis, lorem urna dictum '
                  'turpis, at sodales odio purus id tellus. Nullam '
                  'tincidunt iaculis ipsum, et dictum dolor dictum '
                  'quis. Donec at justo orci. Etiam tincidunt '
                  'imperdiet cursus. Aenean at varius nunc, nec '
                  'maximus ligula. Donec blandit viverra suscipit. '
                  'Duis et finibus nunc. Aliquam interdum nisl posuere, '
                  'volutpat metus in, vestibulum magna. Phasellus et purus '
                  'in tellus aliquet aliquam. Phasellus pulvinar ultricies mattis.',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
