import 'package:bizi/constants/b_colors.dart';
import 'package:bizi/data/language_data.dart';
import 'package:bizi/redux/states/app_state.dart';
import 'package:bizi/views/onboarding/index.dart';
import 'package:bizi/views/widgets/custom_text.dart';
import 'package:bizi/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LanguageSelect extends StatelessWidget {
  final Color color;
  const LanguageSelect({super.key, this.color = BColors.disabledBlue});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return StoreConnector<AppState, OnboadingViewModel>(
        converter: (Store<AppState> store) =>
            OnboadingViewModel.fromStore(store),
        builder: (_, pageModel) {
          return InkWell(
            onTapDown: (TapDownDetails details) {
              pageModel.overlayModel.toggleOverlay(
                offset: details.globalPosition,
                top: details.globalPosition.dy + 15,
                left: MediaQuery.of(context).size.width * 0.53,
                child: Stack(
                  children: [
                    Positioned(
                      right: 5,
                      child: CustomPaint(
                        size: const Size(50, 50),
                        painter: DrawTriangle(),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(top: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30.0,
                          top: 15,
                          bottom: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: LanguageData.allLocales.map((loc) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Locale locale = Locale(loc.locale);
                                    pageModel.changeLocale(locale);

                                    ///TODO
                                    ///Might need to restart the app after the language is changed
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        loc.flag,
                                        height: 17,
                                        width: 17,
                                      ),
                                      const HorizontalSpace(15),
                                      CustomText(
                                        text: loc.language,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                const VerticalSpace(15),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      LanguageData.selectedLocale.flag,
                      height: 17,
                      width: 17,
                    ),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 30,
                      color: BColors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class DrawTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, Paint()..color = BColors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
