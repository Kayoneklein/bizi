part of '../index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _displayBusinessCard() {
    /// show the business card  which is the 3rd index of the [HomeController pageWidgets]
    HomeController.pageIndex = 3;
    setState(() {});
  }

  @override
  void initState() {
    HomeController.displayBusinessCard = _displayBusinessCard;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BiziAppWrapper(
      body: HomeController.pageWidgets[HomeController.pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: HomeController.pageIndex,
        onTap: (int index) {
          if (index == 2) {
            Get.toNamed(RouteName.campaignBuilder);
          } else {
            setState(() {
              HomeController.pageIndex = index;
            });
          }
        },
        backgroundColor: BColors.white,
        selectedItemColor: BColors.blue,
        unselectedItemColor: BColors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(BIcons.home, height: 24),
            activeIcon: Image.asset(
              BIcons.home,
              height: 24,
              color: BColors.blue,
            ),
            label: TextLocalization.home,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(BIcons.announcement, height: 24),
            activeIcon: Image.asset(
              BIcons.announcement,
              height: 24,
              color: BColors.blue,
            ),
            label: TextLocalization.announcement,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(BIcons.addBlue, height: 24),
            activeIcon: Image.asset(
              BIcons.add,
              height: 24,
            ),
            label: TextLocalization.campaign,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(BIcons.notification, height: 24),
            activeIcon: Image.asset(
              BIcons.notification,
              height: 24,
              color: BColors.blue,
            ),
            label: TextLocalization.card,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(BIcons.hexagon, height: 24),
            activeIcon: Image.asset(
              BIcons.hexagon,
              height: 24,
              color: BColors.blue,
            ),
            label: TextLocalization.profile,
          ),
        ],
      ),
    );
  }
}
