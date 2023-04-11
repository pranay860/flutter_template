import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetUserDataUseCase
    extends BaseUseCase<BaseError, GetUserDataUseCaseParams, UserDetailsModel> {
  final CloudDbRepository _firebaseRepository;
  GetUserDataUseCase(this._firebaseRepository);
  @override
  Future<Either<BaseError, UserDetailsModel>> execute(
      {required GetUserDataUseCaseParams params}) async {
    final result = await _firebaseRepository.getUserData(params.userId);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}

class GetUserDataUseCaseParams extends Params {
  String userId;
  GetUserDataUseCaseParams({required this.userId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
