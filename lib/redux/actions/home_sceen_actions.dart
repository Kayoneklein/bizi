import 'package:bizi/models/home_card_model.dart';

class SetHomeCardDetail {
  final bool isBusinessCard;
  final HomeCardModel activeCard;

  const SetHomeCardDetail({
    required this.activeCard,
    required this.isBusinessCard,
  });
}

class ChangeMetricFilter {
  final String metricFilter;

  const ChangeMetricFilter(this.metricFilter);
}
