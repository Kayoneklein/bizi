part of '../index.dart';

class ButtonActionIcons extends StatelessWidget {
  final String icon;
  final String? selectedIcon;
  final double width;
  final double height;
  final Function onTap;
  final bool isDisabled;
  const ButtonActionIcons({
    super.key,
    required this.icon,
    this.width = 14.0,
    this.height = 14.0,
    required this.onTap,
    required this.isDisabled,
    this.selectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: isDisabled ? () {} : () => onTap(),
      icon: Container(
        decoration: BoxDecoration(
          color: selectedIcon == icon ? BColors.lightGrey : null,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            icon,
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }
}
