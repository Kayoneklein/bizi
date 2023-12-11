import 'package:bizi/constants/route_names.dart';
import 'package:bizi/constants/text_localizations.dart';
import 'package:bizi/views/campaign_builder/index.dart';
import 'package:bizi/views/home/index.dart';
import 'package:bizi/views/onboarding/index.dart';
import 'package:bizi/views/welcome/index.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardScreen());
      case RouteName.onBoardingCarousel:
        return MaterialPageRoute(builder: (_) => const OnboardCarouselScreen());
      case RouteName.welcome:
        return MaterialPageRoute(builder: (_) => const Welcome());
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const Home());
      case RouteName.campaignBuilder:
        return MaterialPageRoute(builder: (_) => const CampaignBuilder());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${settings.name} ${TextLocalization.isAnInvalidRouteNotDefinedInThisApp}',
                ),
              ),
            ),
          ),
        );
    }
  }
}
