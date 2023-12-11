part of '../index.dart';

class GiphyImageDisplay extends StatelessWidget {
  const GiphyImageDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.3,
      child: GiphyGetWrapper(
        giphy_api_key: AppConfig.giphyApiKey,
        // Builder with Stream<GiphyGif> and Instance of GiphyGetWrapper
        builder: (stream, giphyGetWrapper) => StreamBuilder<GiphyGif>(
          stream: stream,
          builder: (context, snapshot) {
            //todo: check if snapshot.hasData is true and set the selectedGiphyImage property in redux
            if (snapshot.hasData) {
              print('snapshot.data');
            }
            return const SizedBox.shrink();
            // return Scaffold(
            //   body:
            //   Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children:  [
            //       snapshot.hasData
            //           ? Expanded(
            //               flex: 3,
            //               child: GiphyGifWidget(
            //                 imageAlignment: Alignment.center,
            //                 gif: snapshot.data!,
            //                 giphyGetWrapper: giphyGetWrapper,
            //                 borderRadius: BorderRadius.circular(30),
            //                 showGiphyLabel: false,
            //               ),
            //             )
            //           :
            //      const Center(child: Text("No GIF")),
            //     ],
            //   ),
            //   floatingActionButton: FloatingActionButton(
            //     onPressed: () async {
            //       //Open Giphy Sheet
            //       giphyGetWrapper.getGif('', context);
            //     },
            //     tooltip: 'Open Sticker',
            //     child: const Icon(Icons.insert_emoticon),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
