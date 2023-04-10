import 'package:domain/domain.dart';

abstract class FirebasePort {
  Future<Either<NetworkError, bool>> storeUserData(
      String userId, UserDetailsModel userDetailsModel);

  Future<Either<NetworkError, UserDetailsModel>> getUserData(String userId);
}
