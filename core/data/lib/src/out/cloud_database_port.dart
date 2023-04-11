import 'package:domain/domain.dart';

abstract class CloudDbPort {
  Future<Either<NetworkError, bool>> storeUserData(
      String userId, UserDetailsModel userDetailsModel);

  Future<Either<NetworkError, UserDetailsModel>> getUserData(String userId);
}
