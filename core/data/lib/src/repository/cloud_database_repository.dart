import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CloudDbRepositoryImpl extends CloudDbRepository {
  final CloudDbPort cloudDbPort;
  CloudDbRepositoryImpl(this.cloudDbPort);
  @override
  Future<Either<NetworkError, UserDetailsModel>> getUserData(
      String userId) async {
    final result = await cloudDbPort.getUserData(userId);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<NetworkError, bool>> saveUserData(
      String userId, UserDetailsModel userDetailsModel) async {
    final result = await cloudDbPort.storeUserData(userId, userDetailsModel);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
