part of '../index.dart';

class HomeScreenModel {
  final bool isBusinessCard;
  final HomeCardModel activeCard;
  final Function() changeActiveCard;
  final String metricFilterDuration;
  final List<String> metricFilterArray;
  final Function(String) changeMetricFilter;

  const HomeScreenModel({
    required this.activeCard,
    required this.isBusinessCard,
    required this.changeActiveCard,
    required this.metricFilterDuration,
    required this.metricFilterArray,
    required this.changeMetricFilter,
  });

  static HomeScreenModel fromStore(Store<AppState> store) {
    return HomeScreenModel(
      isBusinessCard: store.state.homeScreenState.isBusinessCard,
      activeCard: store.state.homeScreenState.activeCard,
      changeActiveCard: () {
        if (store.state.homeScreenState.isBusinessCard) {
          store.dispatch(SetHomeCardDetail(
            activeCard: HomeCardModel.personalCard,
            isBusinessCard: false,
          ));
        } else {
          store.dispatch(SetHomeCardDetail(
            activeCard: HomeCardModel.businessCard,
            isBusinessCard: true,
          ));
        }
      },
      metricFilterDuration: store.state.homeScreenState.metricFilterDuration,
      metricFilterArray: ['Last 28 days', 'Last 3 Months'],
      changeMetricFilter: (val) => store.dispatch(ChangeMetricFilter(val)),
    );
  }
}
