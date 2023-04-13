import 'package:domain/domain.dart';

abstract class SaveUserFloorRepository {
  Future<Either<BaseError, int>> saveUserData();
}
