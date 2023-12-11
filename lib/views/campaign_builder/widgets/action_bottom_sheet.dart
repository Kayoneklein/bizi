part of '../index.dart';

class ActionBottomSheet extends StatefulWidget {
  final int rowIndex;
  const ActionBottomSheet({super.key, required this.rowIndex});

  @override
  State<ActionBottomSheet> createState() => _ActionBottomSheetState();
}

class _ActionBottomSheetState extends State<ActionBottomSheet> {
  final linkFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double bottom = MediaQuery.of(context).viewInsets.bottom;
    double generalHeight = 0.45;
    if (CampaignButtonController.buttonEditState ==
        ButtonEditState.buttonPlacement) {
      generalHeight = 0.3;
    }

    return StoreConnector<AppState, CampaignBuilderViewModel>(
        converter: (Store<AppState> store) =>
            CampaignBuilderViewModel.fromStore(store),
        onInit: (Store<AppState> store) {
          ActiveEditRowItem item = ActiveEditRowItem(
            index: widget.rowIndex,
            property: RowProperty.button,
          );
          store.dispatch(UpdateActiveEditRowItem(item));
        },
        builder: (_, viewModel) {
          // final ActiveEditRowItem item =
          //     viewModel.campaignModel.activeEditItem!;
          final button = viewModel.campaignModel.rows[widget.rowIndex].button ??
              CreateCampaignModel.defaultButton();

          return SizedBox(
            height: bottom + size.height * generalHeight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
              child: Column(
                children: [
                  if (CampaignButtonController.buttonEditState ==
                      ButtonEditState.initial)
                    EditButtonPanel(
                      setState: () {
                        setState(() {});
                      },
                      viewModel: viewModel,
                      button: button,
                    ),
                  if (CampaignButtonController.buttonEditState ==
                      ButtonEditState.color)
                    _ButtonColorPanel(
                      setState: () {
                        setState(() {});
                      },
                      button: button,
                      editButton: (ButtonActionModel actionBtn) {
                        viewModel.editCampaignButton(actionBtn);
                      },
                    ),
                  if (CampaignButtonController.buttonEditState ==
                      ButtonEditState.buttonPlacement)
                    _ButtonPlacementPanel(
                      setState: () {
                        setState(() {});
                      },
                      button: button,
                      editButton: (ButtonActionModel actionBtn) {
                        viewModel.editCampaignButton(actionBtn);
                      },
                    ),
                  if (CampaignButtonController.buttonEditState ==
                      ButtonEditState.buttonAction)
                    _ButtonActionPanel(
                      setState: () {
                        setState(() {});
                      },
                      button: button,
                      linkFormKey: linkFormKey,
                      editButton: (ButtonActionModel actionBtn) {
                        viewModel.editCampaignButton(actionBtn);
                      },
                    ),
                ],
              ),
            ),
          );
        });
  }
}

class _ButtonColorPanel extends StatelessWidget {
  final Function setState;
  final ButtonActionModel button;
  final Function(ButtonActionModel) editButton;

  const _ButtonColorPanel({
    required this.setState,
    required this.editButton,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final double bottom = MediaQuery.of(context).viewInsets.bottom;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            CampaignButtonController.setInitialButtonState();
            setState();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        if (bottom == 0)
          Column(
            children: [
              SizedBox(
                height: size.height * 0.17,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 7,
                  physics: const NeverScrollableScrollPhysics(),
                  children:
                      ButtonColorModel.supportedButtonColors.map((btnColor) {
                    return IconButton(
                      onPressed: () {
                        final ButtonActionModel btn =
                            button.copyWith(backgroundColor: btnColor.color);
                        editButton(btn);
                      },
                      icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: btnColor.color,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const VerticalSpace(15),
            ],
          ),
        BiziTextField(
          hintText: 'Add hex color',
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: BColors.grey,
          ),
          filled: true,
          filledColor: BColors.lightGrey,
        ),
        VerticalSpace(bottom == 0 ? 15 : 0),
        Button(
          onPressed: () {
            CampaignButtonController.setInitialButtonState();
            setState();
          },
          text: TextLocalization.done,
          backgroundColor: BColors.blue,
          color: BColors.white,
          borderRadius: 10,
        ),
      ],
    );
  }
}

class _ButtonPlacementPanel extends StatelessWidget {
  final Function setState;
  final ButtonActionModel button;
  final Function(ButtonActionModel) editButton;
  const _ButtonPlacementPanel({
    required this.setState,
    required this.button,
    required this.editButton,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              alignment: Alignment.centerLeft,
              onPressed: () {
                CampaignButtonController.setInitialButtonState();
                setState();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.23, top: 10),
              child: CustomText(
                text: TextLocalization.buttonPlacement,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const VerticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              ButtonPlacementModel.allSupportedPlacements.map((placement) {
            return ButtonPlacementComponent(
              alignment: placement.alignment,
              icon: placement.icon,
              leftBorderRadius: placement.leftBorderRadius,
              rightBorderRadius: placement.rightBorderRadius,
              button: button,
              editButton: (ButtonActionModel btn) {
                editButton(btn);
              },
            );
          }).toList(),
        ),
        const VerticalSpace(30),
        Button(
          onPressed: () {
            CampaignButtonController.setInitialButtonState();
            setState();
          },
          text: TextLocalization.done,
          backgroundColor: BColors.blue,
          color: BColors.white,
          borderRadius: 10,
        ),
      ],
    );
  }
}

class _ButtonActionPanel extends StatelessWidget {
  final Function setState;
  final ButtonActionModel button;
  final GlobalKey<FormState> linkFormKey;
  final Function(ButtonActionModel) editButton;
  const _ButtonActionPanel({
    required this.setState,
    required this.button,
    required this.linkFormKey,
    required this.editButton,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final double bottom = MediaQuery.of(context).viewInsets.bottom;
    String url = button.link?.url ?? '';

    return Form(
      key: linkFormKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                alignment: Alignment.centerLeft,
                onPressed: () {
                  CampaignButtonController.setInitialButtonState();
                  setState();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.28, top: 10),
                child: CustomText(
                  text: TextLocalization.buttonAction,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          if (bottom == 0)
            Column(
              children: [
                const VerticalSpace(40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ButtonActionLinkModel.supportedLinkTypes.map((ty) {
                    return ButtonActionIcons(
                      icon: ty.icon,
                      isDisabled: ty.isDisabled,
                      selectedIcon: ButtonActionLinkModel.filterByType(
                              button.link?.type ?? '')
                          .icon,
                      onTap: () {
                        if (ty.isDisabled == false) {
                          final ButtonActionModel btn = button.copyWith(
                              link: button.link?.copyWith(type: ty.type));
                          editButton(btn);
                        }
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      CustomText(
                        text: TextLocalization.url.toUpperCase(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      ButtonActionIcons(
                        icon: ButtonActionLinkModel.filterByType(
                                button.link?.type ?? '')
                            .icon,
                        isDisabled: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          Container(
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: BColors.lightGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: BiziTextField(
              initialValue: button.link?.url ?? '',
              onChanged: (val) {
                url = val;
              },
              hintText: '',
              validator: (val) {
                if (val == null || val.isEmpty == true) {
                  return TextLocalization.pleaseEnterAValidLink;
                }
                return null;
              },
              onEditingComplete: () {
                _onEditingComplete(context, url);
              },
            ),
          ),
          VerticalSpace(bottom == 0 ? 20 : 0),
          Button(
            onPressed: () {
              _onEditingComplete(context, url);
            },
            text: TextLocalization.done,
            backgroundColor: BColors.blue,
            color: BColors.white,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }

  void _onEditingComplete(BuildContext context, String url) {
    FocusScope.of(context).unfocus();
    if (linkFormKey.currentState!.validate()) {
      ButtonActionLink link = ButtonActionLink(
        url: url,
        type: button.link?.type ?? ButtonLinkType.link,
      );
      final ButtonActionModel btn = button.copyWith(link: link);
      editButton(btn);

      CampaignButtonController.setInitialButtonState();
      setState();
    }
  }
}
