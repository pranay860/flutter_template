import 'package:domain/domain.dart';

import '../out/database_port.dart';
import '../out/network_port.dart';

class UserRepositoryImpl extends UserRepository {
  final DatabasePort databaseProvider;
  final NetworkPort networkPort;

  UserRepositoryImpl(this.databaseProvider, this.networkPort);

  @override
  Future<Either<NetworkError, User>> loginWithEmail(
      {required String email, required String password}) {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseError, User>> saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }

  @override
  Future imagePicker() {
    // TODO: implement imagePicker
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, UserDetailsModel>> registerUserDetails(
      {required String email,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String password}) async {
    return Right(UserDetailsModel(
        email: '', firstName: '', lastName: '', password: '', phoneNumber: ''));
  }
}
