part of '../index.dart';

class BusinessCardController {
  static Future<void> saveContact(BuildContext context) async {
    bool savedContact = false;
    try {
      final Contact contact = Contact(
        displayName: 'David Cain',
        name: Name(first: 'David', last: 'Cain'),
        phones: [Phone('(859) 774-4778')],
        emails: [Email('Davidcain@speakeasy.com')],
      );
      if (await FlutterContacts.requestPermission()) {
        await contact.insert();
        savedContact = true;
      }
    } catch (e) {
      developer
          .log('BusinessCardController + saveContact() error ${e.toString()}');
      savedContact = false;
    }

    if (savedContact == false) {
      _snackBarFeedback(context, TextLocalization.errorSavingThisContact);
      return;
    }
    _snackBarFeedback(context, TextLocalization.contactSavedSuccessfully);
  }

  static void sendMessageToContact() {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: '+2348162422212',
    );
    launchUrl(smsLaunchUri);
  }

  static _snackBarFeedback(BuildContext context, String message) {
    showSnackBar(
      context: context,
      message: message,
    );
  }
}
