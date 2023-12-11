part of '../index.dart';

class TopComponent extends StatelessWidget {
  final Function setState;
  const TopComponent({super.key, required this.setState});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: TextLocalization.bizi,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontSize: 60,
              color: BColors.white,
            ),
          ),
          const VerticalSpace(15),
          Column(
            children: [
              CarouselSlider(
                items: _sliders.map((slider) {
                  return CustomText(
                    text: slider.description,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: BColors.white),
                  );
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  initialPage: SignInCarouselModel.activeSlider.index,
                  height: size.height * 0.06,
                  onPageChanged: (int index, reason) {
                    SignInCarouselModel.activeSlider = _sliders[index];
                    setState();
                  },
                ),
              ),
              Row(
                children: _sliders.map((e) {
                  return Icon(
                    Icons.circle,
                    size: 10,
                    color: e.index == SignInCarouselModel.activeSlider.index
                        ? BColors.white
                        : BColors.white.withOpacity(0.25),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
