part of '../index.dart';

class HomeController {
  static int pageIndex = 0;
  static late Function displayBusinessCard;

  static List<Widget> pageWidgets = [
    const HomeContents(), //0
    const Campaigns(), //1
    const CampaignBuilder(), //2
    const BusinessCardScreen(), //3
    const ProfileScreen(), //4
  ];
}
