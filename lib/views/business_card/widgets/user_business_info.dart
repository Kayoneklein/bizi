part of '../index.dart';

class UserBusinessInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  const UserBusinessInfo({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 11,
            color: BColors.black,
          ),
          const HorizontalSpace(20),
          CustomText(
            text: text,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
