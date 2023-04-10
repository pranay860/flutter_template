import 'package:domain/domain.dart';

abstract class FirebaseRepository {
  Future<Either<NetworkError, bool>> saveUserData(
    String userId,
    UserDetailsModel userDetailsModel,
  );

  Future<Either<NetworkError, UserDetailsModel>> getUserData(String userId);
}
