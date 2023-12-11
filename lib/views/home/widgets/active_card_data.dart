part of '../index.dart';

class ActiveCardData extends StatelessWidget {
  final HomeScreenModel pageModel;
  const ActiveCardData({super.key, required this.pageModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.885,
      child: Card(
        elevation: 1,
        shadowColor: BColors.grey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            right: 22,
            left: 22,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: pageModel.isBusinessCard
                        ? TextLocalization.business.toUpperCase()
                        : TextLocalization.personal.toUpperCase(),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: BColors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  const VerticalSpace(20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(BImages.userAvatar),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 90,
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: '${pageModel.activeCard.firstName}\n',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: BColors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: pageModel.activeCard.lastName,
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color: BColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomText(
                              text: pageModel.activeCard.role,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: BColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.qr_code,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
