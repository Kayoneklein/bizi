part of '../index.dart';

class NameDisplay extends StatelessWidget {
  const NameDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: RichText(
        text: TextSpan(
          text: 'DAVID',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: BColors.black,
            fontSize: 40,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' CAIN',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: 14,
                color: BColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
