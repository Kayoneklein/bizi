import 'package:bizi/models/home_card_model.dart';
import 'package:flutter/material.dart';

@immutable
class HomeScreenState {
  final bool isBusinessCard;
  final HomeCardModel activeCard;
  final String metricFilterDuration;

  const HomeScreenState({
    required this.activeCard,
    required this.isBusinessCard,
    required this.metricFilterDuration,
  });

  factory HomeScreenState.initial() {
    return HomeScreenState(
      isBusinessCard: false,
      activeCard: HomeCardModel.personalCard,
      metricFilterDuration: 'Last 28 days',
    );
  }

  HomeScreenState copyWith({
    bool? isBusinessCard,
    HomeCardModel? activeCard,
    String? metricFilterDuration,
  }) {
    return HomeScreenState(
      isBusinessCard: isBusinessCard ?? this.isBusinessCard,
      activeCard: activeCard ?? this.activeCard,
      metricFilterDuration: metricFilterDuration ?? this.metricFilterDuration,
    );
  }

  static HomeScreenState fromJson(dynamic json) {
    return HomeScreenState(
      isBusinessCard: json['isBusinessCard'],
      activeCard: HomeCardModel.fromJson(json['activeCard']),
      metricFilterDuration: json['metricFilterDuration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isBusinessCard': isBusinessCard,
      'activeCard': activeCard.toJson(),
      'metricFilterDuration': metricFilterDuration,
    };
  }
}
