import 'package:bizi/models/photo_model.dart';
import 'package:bizi/utils/converter.dart';

class UnsplashModel {
  String id;
  PhotoModel photo;

  UnsplashModel({
    required this.id,
    required this.photo,
  });

  static UnsplashModel fromJson(dynamic json) {
    return UnsplashModel(
      id: json['id'],
      photo: PhotoModel.fromJson(json),
    );
  }
}
