part of '../index.dart';

class AnalyticsSection extends StatelessWidget {
  final HomeScreenModel pageModel;
  const AnalyticsSection({super.key, required this.pageModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace(38),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: TextLocalization.analytics,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: BColors.black,
              ),
            ),
            DropdownButton(
              value: pageModel.metricFilterDuration,
              items: pageModel.metricFilterArray.map((metric) {
                return DropdownMenuItem(
                  value: metric,
                  child: CustomText(
                    text: metric,
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                  ),
                );
              }).toList(),
              onChanged: (val) {
                pageModel.changeMetricFilter(val!);
              },
            ),
          ],
        ),
        const VerticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnalyticsCard(title: TextLocalization.engagements),
            AnalyticsCard(title: TextLocalization.actions),
          ],
        ),
        const VerticalSpace(30),
      ],
    );
  }
}
