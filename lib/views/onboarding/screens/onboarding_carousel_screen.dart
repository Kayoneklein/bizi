part of '../index.dart';

class OnboardCarouselScreen extends StatefulWidget {
  const OnboardCarouselScreen({super.key});

  @override
  State<OnboardCarouselScreen> createState() => _OnboardCarouselScreenState();
}

class _OnboardCarouselScreenState extends State<OnboardCarouselScreen> {
  @override
  Widget build(BuildContext context) {
    return BiziAppWrapper(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30, top: 20),
                child: LanguageSelect(),
              ),
            ),
            CarouselSlider(
              items: CarouselData().carouselList.map((item) {
                return CarouselSliderComponent(item: item);
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.6,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: (int page, CarouselPageChangedReason reason) {
                  OnboardingController.changePage(page, () {
                    setState(() {});
                  });
                },
              ),
              carouselController: OnboardingController.controller,
            ),
            const VerticalSpace(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0, 1, 2, 3].map((pg) {
                return Icon(
                  Icons.circle,
                  size: 10,
                  color: pg == OnboardingController.page
                      ? BColors.blue
                      : BColors.disabledBlue,
                );
              }).toList(),
            ),
            Expanded(
              child: BottomActionButtons(
                isSliderPage: true,
                setState: () {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
