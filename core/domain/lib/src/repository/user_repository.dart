import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class UserRepository {
  Future<Either<NetworkError, User>> loginWithEmail(
      {required String email, required String password});

  Future<Either<DatabaseError, User>> saveUser(User user);

  Future<Either<BaseError, UserDetailsModel>> registerUserDetails(
      {String? email,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      String? password,
      Enum? gender});

  Future imagePicker();
}
