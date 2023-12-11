part of '../index.dart';

class CampaignDetailOption extends StatelessWidget {
  final String option;
  final dynamic icon;
  final Function onTap;
  const CampaignDetailOption({
    super.key,
    required this.icon,
    required this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: icon is String
                    ? Image.asset(
                        icon,
                        width: 28,
                        height: 28,
                      )
                    : Icon(
                        icon,
                        size: 28,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10),
              child: Text(
                option,
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
