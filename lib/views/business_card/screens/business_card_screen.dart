part of '../index.dart';

class BusinessCardScreen extends StatelessWidget {
  const BusinessCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BiziAppWrapper(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 20.0,
        ),
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            children: [
              ImgAndQrCard(),
              NameDisplay(),
              AboutMeAndContactInfo(),
              VerticalSpace(10),
              CardButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
