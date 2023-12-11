part of '../index.dart';

class LeaveCampaignBuilderButton extends StatelessWidget {
  final bool hasEditedCampaign;
  final Function resetBuilderState;
  const LeaveCampaignBuilderButton({
    super.key,
    required this.hasEditedCampaign,
    required this.resetBuilderState,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: () {
        if (hasEditedCampaign) {
          showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: CustomText(
                  text: TextLocalization
                      .areYouSureYouWantToStopBuildingThisCampaign,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 18,
                  ),
                ),
                actionsAlignment: MainAxisAlignment.spaceAround,
                actions: [
                  TextButton(
                    onPressed: () {
                      resetBuilderState();
                      Get.offAllNamed(RouteName.home);
                    },
                    child: CustomText(
                      text: TextLocalization.yes,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: CustomText(
                      text: TextLocalization.cancel,
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          Get.back();
        }
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: BColors.grey,
      ),
    );
  }
}
