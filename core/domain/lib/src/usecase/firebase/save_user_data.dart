import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class SaveUserDataUseCase
    extends BaseUseCase<BaseError, SaveUserDataUseCaseParams, bool> {
  final CloudDbRepository _firebaseRepository;
  SaveUserDataUseCase(this._firebaseRepository);
  @override
  Future<Either<BaseError, bool>> execute(
      {required SaveUserDataUseCaseParams params}) async {
    final result = await _firebaseRepository.saveUserData(
        params.userId, params.userDetailsModel);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}

class SaveUserDataUseCaseParams extends Params {
  String userId;
  UserDetailsModel userDetailsModel;
  SaveUserDataUseCaseParams(
      {required this.userId, required this.userDetailsModel});

  @override
  Either<AppError, bool> verify() {
    if (userDetailsModel.email == null || userDetailsModel.email!.isEmpty) {
      return Left(AppError(
          error: ErrorInfo(message: "INVALID EMAIL"),
          type: ErrorType.uiEmptyEmail,
          throwable: Exception("EMPTY EMAIL")));
    }
    return Right(true);
  }
}
