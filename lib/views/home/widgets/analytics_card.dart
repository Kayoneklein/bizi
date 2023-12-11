part of '../index.dart';

class AnalyticsCard extends StatelessWidget {
  final String title;
  const AnalyticsCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: BColors.grey,
      elevation: 0.9,
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.42,
        height: MediaQuery.of(context).size.height * 0.125,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            bottom: 15,
            left: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: BColors.black,
                  fontSize: 12,
                ),
              ),
              const VerticalSpace(10),
              Row(
                children: [
                  CustomText(
                    text: '365',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const HorizontalSpace(10),
                  RichText(
                    text: TextSpan(
                      text: '+',
                      children: <TextSpan>[
                        TextSpan(
                          text: ' 1.4%',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                            color: BColors.lemon,
                          ),
                        ),
                      ],
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 12.0,
                        color: BColors.lemon,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
