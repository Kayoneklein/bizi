part of '../index.dart';

class UnsplashImageDisplay extends StatelessWidget {
  final List<PhotoModel> photos;
  final int rowIndex;
  final Function(int, RowImage) selectRowPhoto;

  const UnsplashImageDisplay({
    super.key,
    required this.photos,
    required this.rowIndex,
    required this.selectRowPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: photos.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              RowImage img = RowImage(path: photos[index].url);
              selectRowPhoto(rowIndex, img);
            },
            child: CachedImage(imageUrl: photos[index].url),
          );
        },
      ),
    );
  }
}
