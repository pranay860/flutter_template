import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class UserRepository {
  Future<Either<NetworkError, User>> loginWithEmail(
      {required String email, required String password});

  Future<Either<DatabaseError, User>> saveUser(User user);

  Future<Either<BaseError, UserDetailsModel>> registerUserDetails(
      {required String email,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String password});

  Future imagePicker();
}
