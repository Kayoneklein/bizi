part of '../index.dart';

class CarouselSliderComponent extends StatelessWidget {
  final OnboardingCarouselViewModel item;
  const CarouselSliderComponent({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        item.topChild,
        CustomText(
          text: item.title,
          style: theme.textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const VerticalSpace(30),
        CustomText(
          text: item.description,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
