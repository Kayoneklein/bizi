part of '../index.dart';

class WelcomeButton extends StatelessWidget {
  final Function onTap;
  final String icon;
  final String text;
  final double borderRadius;
  final FontWeight? fontWeight;
  const WelcomeButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.borderRadius = 37.0,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.02),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: BColors.white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: 20,
              ),
              const HorizontalSpace(25),
              CustomText(
                text: text,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
