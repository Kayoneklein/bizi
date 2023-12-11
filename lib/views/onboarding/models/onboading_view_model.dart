part of '../index.dart';

class OnboadingViewModel {
  final OverlayModel overlayModel;
  final Function(Locale) changeLocale;
  final Locale locale;

  const OnboadingViewModel({
    required this.overlayModel,
    required this.changeLocale,
    required this.locale,
  });

  static OnboadingViewModel fromStore(Store<AppState> store) {
    return OnboadingViewModel(
      overlayModel: OverlayModel.fromStore(store),
      changeLocale: (Locale locale) {
        store.dispatch(ChangeLocale(locale));
      },
      locale: store.state.globalAppPropertiesState.locale,
    );
  }
}
