part of '../index.dart';

class AboutMeAndContactInfo extends StatelessWidget {
  const AboutMeAndContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              text: TextLocalization.aboutMe,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomText(
              text:
                  'I’m an entrepreneur, investor, business executive, board member, bank director, mentor, and advisor.',
              style: theme.textTheme.bodyMedium,
            ),
            const VerticalSpace(20),
            const Divider(thickness: 2),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UserBusinessInfo(
                    icon: Icons.phone,
                    text: '(859) 774-4778',
                  ),
                  UserBusinessInfo(
                    icon: Icons.email,
                    text: 'Davidcain@speakeasy.com',
                  ),
                  UserBusinessInfo(
                    icon: Icons.location_on,
                    text: 'Covington, Kentucky',
                  ),
                  UserBusinessInfo(
                    icon: Icons.sports_basketball_outlined,
                    text: 'www.speakeasy.com',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
