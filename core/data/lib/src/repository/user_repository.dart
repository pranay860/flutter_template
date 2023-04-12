import 'dart:io';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl extends UserRepository {
  final DatabasePort databaseProvider;
  final NetworkPort networkPort;
  final CloudDbPort firebasePort;

  UserRepositoryImpl(
      this.databaseProvider, this.networkPort, this.firebasePort);

  @override
  Future<Either<NetworkError, User>> loginWithEmail(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future imagePicker() {
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, UserDetailsModel>> registerUserDetails(
      {String? email,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      String? password,
      File? userImage,
      Enum? gender}) async {
    return Right(UserDetailsModel(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
        phoneNumber: phoneNumber,
        userImage: userImage,
        gender: gender.toString()));
  }

  @override
  Future<Either<DatabaseError, User>> saveUser(User user) {
    throw UnimplementedError();
  }
}
