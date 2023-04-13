import 'package:data/src/out/database_port.dart';
import 'package:domain/domain.dart';

class DatabaseFloorRepositoryIml extends SaveUserFloorRepository {
  DatabasePort databasePort;
  DatabaseFloorRepositoryIml(this.databasePort);

  @override
  void fetchAllUsers() {
    // TODO: implement fetchAllUsers
  }

  @override
  void reload() {
    // TODO: implement reload
  }

  @override
  Future<Either<BaseError, int>> saveUserData() async {
    return (await databasePort.saveUser())
        .fold((l) => Left(l), (r) => Right(r));
  }

  // Future<Either<BaseError, bool>> saveUser() async {
  //   return await databasePort.saveUser();
  // }
}
