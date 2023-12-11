part of '../index.dart';

class CardButtons extends StatelessWidget {
  const CardButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Button(
          onPressed: () {
            BusinessCardController.saveContact(context);
          },
          text: TextLocalization.saveContact,
          backgroundColor: BColors.blue,
          color: BColors.white,
          size: Size(MediaQuery.of(context).size.width * 0.8, 45),
          borderRadius: 12,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
        ),
        Button(
          onPressed: () {
            BusinessCardController.sendMessageToContact();
          },
          text: TextLocalization.sendAMessage('David'),
          backgroundColor: BColors.white,
          color: BColors.blue,
          size: Size(MediaQuery.of(context).size.width * 0.8, 45),
          borderRadius: 12,
          borderWidth: 2,
          borderSideColor: BColors.blue,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
        ),
      ],
    );
  }
}
