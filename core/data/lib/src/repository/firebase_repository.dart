import 'package:data/data.dart';
import 'package:domain/domain.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final FirebasePort firebasePort;
  FirebaseRepositoryImpl(this.firebasePort);
  @override
  Future<Either<NetworkError, UserDetailsModel>> getUserData(
      String userId) async {
    final result = await firebasePort.getUserData(userId);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<NetworkError, bool>> saveUserData(
      String userId, UserDetailsModel userDetailsModel) async {
    final result = await firebasePort.storeUserData(userId, userDetailsModel);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
