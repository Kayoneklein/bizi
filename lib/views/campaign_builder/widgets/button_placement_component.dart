part of '../index.dart';

class ButtonPlacementComponent extends StatelessWidget {
  final IconData icon;
  final String alignment;
  final bool leftBorderRadius;
  final bool rightBorderRadius;
  final ButtonActionModel button;
  final Function(ButtonActionModel) editButton;
  const ButtonPlacementComponent({
    super.key,
    required this.icon,
    required this.alignment,
    this.leftBorderRadius = false,
    this.rightBorderRadius = false,
    required this.editButton,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: MediaQuery.of(context).size.width * 0.285,
      height: 50,
      decoration: BoxDecoration(
        color: button.placement == alignment
            ? BColors.lightGrey
            : BColors.veryLightGrey,
        borderRadius: BorderRadius.only(
          topLeft: leftBorderRadius ? const Radius.circular(10) : Radius.zero,
          bottomLeft:
              leftBorderRadius ? const Radius.circular(10) : Radius.zero,
          topRight: rightBorderRadius ? const Radius.circular(10) : Radius.zero,
          bottomRight:
              rightBorderRadius ? const Radius.circular(10) : Radius.zero,
        ),
      ),
      child: TextButton(
        onPressed: () {
          final btn = button.copyWith(placement: alignment);
          editButton(btn);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: BColors.black,
            ),
            const HorizontalSpace(15),
            CustomText(
              text: alignment,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
