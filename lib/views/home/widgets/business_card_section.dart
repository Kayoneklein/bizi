part of '../index.dart';

class BusinessCardSection extends StatelessWidget {
  final HomeScreenModel pageModel;
  const BusinessCardSection({super.key, required this.pageModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: TextLocalization.yourBusinessCards,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: BColors.black,
          ),
        ),
        const VerticalSpace(12),
        Stack(
          children: [
            InkWell(
              onTap: () => pageModel.changeActiveCard(),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.885,
                decoration: BoxDecoration(
                  border: Border.all(color: BColors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
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
                      CustomText(
                          text: !pageModel.isBusinessCard
                              ? TextLocalization.business.toUpperCase()
                              : TextLocalization.personal.toUpperCase(),
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            color: BColors.grey,
                          )),
                      const Icon(
                        Icons.qr_code,
                        size: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              bottom: 0,
              left: 1,
              right: 1,
              child: InkWell(
                onTap: () => HomeController.displayBusinessCard(),
                child: ActiveCardData(pageModel: pageModel),
              ),
            ),
          ],
        ),
        const VerticalSpace(5),
      ],
    );
  }
}
