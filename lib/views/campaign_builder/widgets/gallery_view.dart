import 'dart:io';
import 'dart:typed_data';
import 'package:bizi/constants/text_localizations.dart';
import 'package:bizi/models/create_campaign_model.dart';
import 'package:flutter/material.dart';
// import 'package:photo_manager/photo_manager.dart';
// import 'crop.dart';

class GalleryView extends StatefulWidget {
  final int rowIndex;
  final Function(int, RowImage) selectRowPhoto;

  const GalleryView({
    super.key,
    required this.rowIndex,
    required this.selectRowPhoto,
  });

  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  int _albumPage = 0;
  int _selectedAlbum = 0;

  bool _loadingImages = false;

  List _albums = [];
  // List<AssetPathEntity> _albums = [];
  final List _photos = [];
  // final List<AssetEntity> _photos = [];

  @override
  void initState() {
    _loadImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      // height: double.infinity,
      color: const Color(0xffF5F5F5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
            child: Text(
              TextLocalization.albums,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          _albums.isNotEmpty
              ? SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      itemCount: _albums.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () => _changePhotoAlbum(index),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Material(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    elevation: 2,
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      alignment: Alignment.center,
                                      child: Text(
                                        _albums[index].name,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ));
                      }),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 8,
            ),
            child: Text(
              TextLocalization.photos,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scroll) {
                  if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent >
                          0.80 &&
                      !_loadingImages) {
                    _loadMoreImages();
                  }
                  return true;
                },
                child: GridView.builder(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: _photos.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return FutureBuilder<Uint8List?>(
                      future: _photos[index].thumbnailData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.data != null) {
                          return InkWell(
                            onTap: () {},
                            // onTap: () => _handleImageSelect(_photos[index]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.memory(
                                snapshot.data!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          child: const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _loadImages() async {
    _loadingImages = true;
    // var permission = await PhotoManager.requestPermissionExtend();
    // if (!permission.hasAccess) {
    //   return;
    // }

    // Check for photo albums
    if (_albums.isEmpty) {
      await _setPhotoAlbums();
    }

    if (_albums.isEmpty) {
      return;
    }

    // List<AssetEntity> _newPhotos = await _albums[_selectedAlbum]
    //     .getAssetListPaged(page: _albumPage, size: 40);
    setState(() {
      // _photos.addAll(_newPhotos);
      _loadingImages = false;
    });
  }

  Future<void> _setPhotoAlbums() async {
    // List<AssetPathEntity> _items =
    //     await PhotoManager.getAssetPathList(type: RequestType.image);
    setState(() {
      // _albums = _items;
      _loadingImages = false;
    });
  }

  void _changePhotoAlbum(int index) {
    setState(() {
      _selectedAlbum = index;
      _albumPage = 0;
      _photos.clear();
    });
    _loadImages();
  }

  void _loadMoreImages() async {
    if (_loadingImages) {
      return;
    }
    _loadingImages = true;

    int _total = await _albums[_selectedAlbum].assetCountAsync;
    if (_photos.length < _total) {
      // List<AssetEntity> _newPhotos = await _albums[_selectedAlbum]
      //     .getAssetListPaged(page: _albumPage + 1, size: 40);
      // _photos.addAll(_newPhotos);
      setState(() {
        _albumPage = _albumPage + 1;
      });
    }

    _loadingImages = false;
  }

  // void _handleImageSelect(AssetEntity asset) async {
  //   File? image = await asset.file;
  //   if (image == null) {
  //     return;
  //   }
  //
  //   // File? _croppedImage = await Navigator.push(
  //   //     context, MaterialPageRoute(builder: (ctx) => Cropper(image: _image),),);
  //   // widget.setImage(_croppedImage);
  //   RowImage img = RowImage(
  //     path: image.path,
  //     isRemote: false,
  //   );
  //   widget.selectRowPhoto(widget.rowIndex, img);
  // }
}
