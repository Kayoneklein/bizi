part of '../index.dart';

class PexelsImageDisplay extends StatelessWidget {
  final List<PhotoModel> pexelsPhotos;
  final int rowIndex;
  final Function(int, RowImage) selectRowPhoto;

  const PexelsImageDisplay({
    super.key,
    required this.pexelsPhotos,
    required this.rowIndex,
    required this.selectRowPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: pexelsPhotos.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () {
                RowImage img = RowImage(path: pexelsPhotos[index].url);
                selectRowPhoto(rowIndex, img);
              },
              child: CachedImage(imageUrl: pexelsPhotos[index].url),
            );
          },
        ),
      ),
    );
  }
}
