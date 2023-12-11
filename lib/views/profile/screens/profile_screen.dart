part of '../index.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BiziAppWrapper(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 23, top: 20),
                        child: Icon(
                          Icons.qr_code,
                          size: 30,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 53,
                      backgroundColor: BColors.pink.withOpacity(0.3),
                      backgroundImage: const AssetImage(BImages.profile),
                    ),
                    const VerticalSpace(20),
                    CustomText(
                      text: 'David Cain',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomText(
                      text: 'David@speakeasy.com',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: BColors.grey),
                    ),
                    const VerticalSpace(16),
                    Button(
                      onPressed: () {},
                      text: TextLocalization.editProfile,
                      backgroundColor: BColors.blue,
                      color: BColors.white,
                      size: const Size(139, 37),
                    ),
                    const VerticalSpace(27),
                  ],
                ),
              ),
              const VerticalSpace(30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CustomText(
                  text: TextLocalization.preferences.toUpperCase(),
                  style:
                      theme.textTheme.bodyMedium?.copyWith(color: BColors.grey),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                    left: 20,
                    top: 12,
                    bottom: 19,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.sports_basketball,
                                color: BColors.grey,
                              ),
                              const HorizontalSpace(12),
                              CustomText(
                                text: TextLocalization.language,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: TextLocalization.english,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const HorizontalSpace(13),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 9,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const VerticalSpace(23),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.payments_outlined,
                                color: BColors.grey,
                              ),
                              const HorizontalSpace(12),
                              CustomText(
                                text: TextLocalization.payment,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 9,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpace(30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CustomText(
                  text: TextLocalization.socials.toUpperCase(),
                  style:
                      theme.textTheme.bodyMedium?.copyWith(color: BColors.grey),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                    left: 20,
                    top: 12,
                    bottom: 19,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                BIcons.twitter,
                                width: 21,
                                height: 21,
                              ),
                              const HorizontalSpace(12),
                              CustomText(
                                text: TextLocalization.twitter,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: TextLocalization.connected,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: BColors.lemon,
                                ),
                              ),
                              const HorizontalSpace(13),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 9,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const VerticalSpace(23),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                BIcons.instagram,
                                width: 21,
                                height: 21,
                              ),
                              const HorizontalSpace(12),
                              CustomText(
                                text: TextLocalization.instagram,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: TextLocalization.notConnected,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: BColors.grey,
                                ),
                              ),
                              const HorizontalSpace(13),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 9,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const VerticalSpace(23),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                BIcons.venmo,
                                width: 21,
                                height: 21,
                              ),
                              const HorizontalSpace(12),
                              CustomText(
                                text: TextLocalization.venmo,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: TextLocalization.notConnected,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: BColors.grey,
                                ),
                              ),
                              const HorizontalSpace(13),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 9,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
