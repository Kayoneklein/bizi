import 'package:bizi/models/user_model.dart';

class UserState {
  final bool isLoading;
  final UserModel user;
  final String errorMessage;
  final String successMessage;

  const UserState({
    required this.isLoading,
    required this.user,
    required this.errorMessage,
    required this.successMessage,
  });

  factory UserState.initial() {
    return const UserState(
      isLoading: false,
      user: UserModel(),
      errorMessage: '',
      successMessage: '',
    );
  }

  UserState copyWith({
    bool? isLoading,
    UserModel? user,
    String? errorMessage,
    String? successMessage,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }

  static UserState fromJson(Map<String, dynamic> json) {
    return UserState(
      isLoading: json['isLoading'],
      user: json['user'] != null
          ? UserModel.fromJson(json['user'])
          : const UserModel(),
      errorMessage: json['errorMessage'],
      successMessage: json['successMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isLoading': isLoading,
      'errorMessage': errorMessage,
      'successMessage': successMessage,
      'user': user.toJson(),
    };
  }
}
