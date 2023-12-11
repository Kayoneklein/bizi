import 'package:bizi/models/photo_model.dart';
import 'package:bizi/utils/converter.dart';

class PexelModel {
  int page;
  int perPage;
  List<PhotoModel> photos;

  PexelModel({
    required this.page,
    required this.perPage,
    required this.photos,
  });

  static PexelModel fromJson(dynamic json) {
    return PexelModel(
      page: json['page'],
      perPage: json['per_page'],
      photos: convertListDynamicToListPhotoModel(json['photos'] ?? []),
    );
  }
}
