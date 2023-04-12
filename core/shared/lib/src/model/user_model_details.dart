import 'dart:io';

class UserDetailsModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String? gender;
  final File? userImage;

  UserDetailsModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.gender,
      required this.userImage});
}
