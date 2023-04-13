import 'package:domain/domain.dart';
import 'package:domain/src/repository/save_user_floor.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class SaveFloorUserData
    extends BaseUseCase<BaseError, UserFloorUseCaseParams, bool> {
  final SaveUserFloorRepository _saveUserFloorRepository;
  SaveFloorUserData(this._saveUserFloorRepository);
  //
  @override
  Future<Either<BaseError, bool>> execute(
      {required UserFloorUseCaseParams params}) async {
    return (await _saveUserFloorRepository.saveUserData())
        .fold((l) => Left(l), (r) => Right(r));
  }
}

class UserFloorUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
