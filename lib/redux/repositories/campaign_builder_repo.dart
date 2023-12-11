import 'dart:convert';

import 'package:bizi/config.dart';
import 'package:bizi/constants/text_localizations.dart';
import 'package:bizi/models/pexel_model.dart';
import 'package:bizi/models/photo_model.dart';
import 'package:bizi/models/unsplash_model.dart';
import 'package:bizi/views/campaign_builder/index.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'package:unsplash_client/unsplash_client.dart';

Future<List<PhotoModel>> fetchPexelsImages({
  int page = 1,
  bool isSearch = false,
  String? query,
}) async {
  String url;

  try {
    if (isSearch && (query == null || query.isEmpty)) {
      throw Exception(TextLocalization.pleaseIncludeAKeywordInYourSearch);
    }
    if (isSearch) {
      url = 'https://api.pexels.com/v1/search?query=${query?.trim()}';
    } else {
      url = 'https://api.pexels.com/v1/curated?page=$page&per_page=40';
    }

    final response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": AppConfig.pexelsApiKey},
    );

    if (response.statusCode == 200) {
      PexelModel pexel = PexelModel.fromJson(jsonDecode(response.body));
      return pexel.photos;
    }
    throw response.body;
  } catch (e) {
    developer.log('fetchPexelsImages error ${e.toString()}');
    return [];
  }
}

Future<List<PhotoModel>> getUnsplashPhotos() async {
  try {
    List<Photo> photos =
        await ImageBuilderController.client.photos.random(count: 10).goAndGet();
    List<PhotoModel> unsplashPhotos = [];
    for (Photo photo in photos) {
      unsplashPhotos.add(PhotoModel(url: photo.urls.thumb.toString()));
    }
    return unsplashPhotos;
  } catch (e) {
    developer.log('getUnsplashPhotos error ${e.toString()}');
    return [];
  }
}

Future<List<PhotoModel>> unsplashPhotoSearch({
  int page = 1,
  required String query,
}) async {
  try {
    final response = await http.get(
      Uri.parse(
          'https://api.unsplash.com/search/photos?page=$page&query=$query'),
      headers: {"Authorization": 'Client-ID ${AppConfig.unsplashAccessKey}'},
    );

    List<PhotoModel> photos = [];

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body)['results'];
      for (var json in jsonList) {
        UnsplashModel unsplash = UnsplashModel.fromJson(json);
        photos.add(unsplash.photo);
      }
    }
    return photos;
  } catch (e) {
    developer.log('fetchPexelsImages error ${e.toString()}');
    return [];
  }
}
