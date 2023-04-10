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
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseError, User>> saveUser(User user) {
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
      String? password}) async {
    return Right(UserDetailsModel(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
        phoneNumber: phoneNumber));
  }
}
