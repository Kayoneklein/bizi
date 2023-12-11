part of '../index.dart';

class ImageRowSelect extends StatelessWidget {
  final RowImage? image;
  const ImageRowSelect({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.26,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            elevation: 5,
            backgroundColor: BColors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (ctx) {
              return SizedBox(
                height: size.height * 0.4,
                child: const Column(
                  children: [],
                ),
              );
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image?.path == null)
              Container(
                width: size.width,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  color: BColors.lightGrey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Image.asset(
                        BIcons.image,
                        height: 35,
                        width: 70,
                      ),
                    ),
                    CustomText(
                      text: TextLocalization.tapToAddPhoto,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

            /// UNSPLASH AND PIXELS IMAGE DISPLAY CONDITION
            if (image?.path != null && image?.isRemote == true)
              Image.network(
                image!.path!,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.fitWidth,
              ),

            ///GIPHY IMAGE DISPLAY CONDITION
            if (image?.path != null && image?.isGif == true)
              //TODO: IMPLEMENT GIPHY IMAGE WIDGET
              Image.network(
                image!.path!,
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.8,
              ),

            ///FILE IMAGE DISPLAY CONDITION
            if (image?.path != null && image?.isRemote == false)
              Image.file(
                File(image?.path ?? ''),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.fitWidth,
              ),
          ],
        ),
      ),
    );
  }
}
