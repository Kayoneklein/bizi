class HomeCardModel {
  final String cardType;
  final String firstName;
  final String lastName;
  final String role;
  // final String qrCode;
  // final String imgUrl;

  const HomeCardModel({
    required this.lastName,
    required this.firstName,
    required this.cardType,
    required this.role,
  });

  static HomeCardModel fromJson(Map<String, dynamic> json) {
    return HomeCardModel(
      lastName: json['lastName'],
      firstName: json['firstName'],
      cardType: json['cardType'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastName': lastName,
      'firstName': firstName,
      'cardType': cardType,
      'role': role,
    };
  }

  static HomeCardModel get businessCard => HomeCardModel(
        lastName: 'Bizi'.toUpperCase(),
        firstName: 'Bizi'.toUpperCase(),
        cardType: 'Business'.toUpperCase(),
        role: 'Director'.toUpperCase(),
      );
  static HomeCardModel get personalCard => HomeCardModel(
        lastName: 'Cain'.toUpperCase(),
        firstName: 'David'.toUpperCase(),
        cardType: 'Personal'.toUpperCase(),
        role: 'Manager'.toUpperCase(),
      );
}
