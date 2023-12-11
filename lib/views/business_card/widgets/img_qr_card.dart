part of '../index.dart';

class ImgAndQrCard extends StatelessWidget {
  const ImgAndQrCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage(
                BImages.businessCardProfile,
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: null,
        ),
        Positioned(
          top: 17,
          left: 14,
          child: Container(),
          // InkWell(
          //   onTap: () => Navigator.pop(context),
          //   child: const Icon(
          //     Icons.arrow_back_ios_new,
          //     color: BColors.white,
          //     size: 16,
          //   ),
          // ),
        ),
        const Positioned(
          top: 17,
          right: 22,
          child: Icon(
            Icons.qr_code,
            size: 21,
            color: BColors.white,
          ),
        )
      ],
    );
  }
}
