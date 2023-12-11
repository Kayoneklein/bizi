import 'package:bizi/constants/text_localizations.dart';
import 'package:bizi/utils/extensions.dart';
import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 1),
    // action: SnackBarAction(
    //   label: 'ACTION',
    //   onPressed: () { },
    // ),
  ));
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return TextLocalization.enterPassword;
  }
  if (password.hasUpperCase() == false) {
    return TextLocalization.passwordsMustContainUppercaseLetters;
  }
  if (password.hasLowerCase() == false) {
    return TextLocalization.passwordsMustContainLowercaseLetters;
  }
  if (password.hasNumber() == false) {
    return TextLocalization.passwordsMustContainNumbers;
  }
  if (password.hasSpecialCharacter() == false) {
    return TextLocalization.passwordsMustContainSpecialCharacters;
  }

  if (password.isLongEnough() == false) {
    return TextLocalization.passwordsMustContainAtLeast6Characters;
  }
  return null;
}
