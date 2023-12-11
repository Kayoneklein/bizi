class UserModel {
  final String? id;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;

  const UserModel({
    this.id,
    this.email,
    this.password,
    this.lastName,
    this.firstName,
  });

  UserModel copyWith({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: email ?? this.password,
      firstName: email ?? this.firstName,
      lastName: email ?? this.lastName,
    );
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    /// passwords are not included when data is received from a json source
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
