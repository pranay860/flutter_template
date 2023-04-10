import 'package:data/data.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl extends UserRepository {
  final DatabasePort databaseProvider;
  final NetworkPort networkPort;
  final FirebasePort firebasePort;

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
      Enum? gender}) async {
    return Right(UserDetailsModel(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
        phoneNumber: phoneNumber,
        gender: gender.toString()));
  }

  @override
  Future<Either<NetworkError, UserDetailsModel>> getUserData(
      String userId) async {
    final result = await firebasePort.getUserData(userId);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  /// To register user details in to firestore database
  @override
  Future<Either<NetworkError, bool>> saveUserData(
      String userId, UserDetailsModel userDetailsModel) async {
    final result = await firebasePort.storeUserData(userId, userDetailsModel);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<DatabaseError, User>> saveUser(User user) {
    throw UnimplementedError();
  }
}
