import 'package:bizi/models/photo_model.dart';
import 'package:bizi/redux/actions/campaign_builder_actions.dart';
import 'package:bizi/redux/repositories/campaign_builder_repo.dart';
import 'package:bizi/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class CampaignBuilderMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is GetPexelsPhotos) {
      List<PhotoModel> photos = await fetchPexelsImages(
        isSearch: action.isSearch,
        page: action.page,
        query: action.query,
      );

      ///TODO: Use pagination for this
      List<PhotoModel> photosLimit = photos.take(12).toList();
      store.dispatch(SetPexelsPhotos(photosLimit));
    }

    if (action is GetUnsplashPhotos) {
      List<PhotoModel> photos;
      if (action.isSearch && action.query != null && action.query!.isNotEmpty) {
        photos = await unsplashPhotoSearch(
          query: action.query!,
          page: action.page,
        );
      } else {
        photos = await getUnsplashPhotos();
      }

      ///TODO: Use pagination for this
      List<PhotoModel> photosLimit = photos.take(12).toList();
      store.dispatch(SetUnsplashPhotos(photosLimit));
    }
    next(action);
  }
}
