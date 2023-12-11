part of '../index.dart';

class EditButtonPanel extends StatelessWidget {
  final CampaignBuilderViewModel viewModel;
  final ButtonActionModel button;
  final Function setState;

  const EditButtonPanel({
    super.key,
    required this.viewModel,
    required this.setState,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BiziTextField(
            hintText: button.buttonText,
            textCapitalization: TextCapitalization.sentences,
            onChanged: (val) {
              if (val.isNotEmpty) {
                final newButton = button.copyWith(buttonText: val);
                viewModel.editCampaignButton(newButton);
              }
            },
            filled: true,
            filledColor: BColors.veryLightGrey,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: BColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          _ButtonEditComponent(
            icon: ButtonActionLinkModel.filterByType(button.link?.type ?? '')
                .icon,
            text: TextLocalization.buttonAction,
            onTap: () {
              CampaignButtonController.changeButtonAction();
              setState();
            },
          ),
          _ButtonEditComponent(
            icon: null,
            color: button.backgroundColor,
            text: TextLocalization.color,
            onTap: () {
              CampaignButtonController.setColorEditAction();
              setState();
            },
          ),
          _ButtonEditComponent(
            icon: ButtonPlacementModel.filterByPlacement(button.placement).icon,
            text: TextLocalization.buttonPlacement,
            additionalText: button.placement,
            onTap: () {
              CampaignButtonController.editButtonPlacement();
              setState();
            },
          ),
          const VerticalSpace(15),
          Button(
            onPressed: () {
              ///TODO: ADD THE BUTTON TO THE CAMPAIGN BUILDER
              Get.back();
            },
            text: TextLocalization.done,
            backgroundColor: BColors.blue,
            borderRadius: 10,
            color: BColors.white,
            size: Size(size.width, 40),
          ),
        ],
      ),
    );
  }
}

class _ButtonEditComponent extends StatelessWidget {
  final dynamic icon;
  final Color? color;
  final String text;
  final String? additionalText;
  final Function onTap;
  const _ButtonEditComponent({
    required this.icon,
    required this.text,
    required this.onTap,
    this.additionalText,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
          child: InkWell(
            onTap: () => onTap(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: text,
                  style: theme.textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    if (icon != null && icon is String)
                      Image.asset(
                        icon!,
                        width: 16,
                        height: 16,
                      ),
                    if (icon != null && icon is IconData)
                      Icon(
                        icon!,
                        size: 16,
                      ),
                    if (color != null)
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    const HorizontalSpace(10),
                    if (additionalText != null)
                      Row(
                        children: [
                          CustomText(
                            text: additionalText ?? '',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: BColors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const HorizontalSpace(10),
                        ],
                      ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: BColors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const Divider(thickness: 2),
      ],
    );
  }
}
