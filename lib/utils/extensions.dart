extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool hasSpecialCharacter() {
    return RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(this);
  }

  bool hasUpperCase() {
    return RegExp(r'^(?=.*?[A-Z])').hasMatch(this);
  }

  bool hasLowerCase() {
    return RegExp(r'^(?=.*?[a-z])').hasMatch(this);
  }

  bool hasNumber() {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(this);
  }

  bool isLongEnough() {
    return RegExp(r'^.{6,}').hasMatch(this);
  }
}
