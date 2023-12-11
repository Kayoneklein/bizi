part of '../index.dart';

class ImageOptionButton extends StatelessWidget {
  final Function onTap;
  final String icon;
  final bool isActive;
  final double height;
  const ImageOptionButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.isActive,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: isActive
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: BColors.blue),
              )
            : null,
        child: Image.asset(
          icon,
          height: height,
        ),
      ),
    );
  }
}
