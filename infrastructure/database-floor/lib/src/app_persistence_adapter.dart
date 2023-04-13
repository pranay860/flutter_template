import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:database_floor/src/app_database.dart';
import 'package:database_floor/src/model/user_entity.dart';

class AppPersistenceAdapter implements DatabasePort {
  final AppDatabase appDatabase;

  AppPersistenceAdapter(this.appDatabase);

  @override
  void fetchAllUsers() {
    appDatabase.userDao.getUsers();
  }

  @override
  void reload() {
    // TODO: implement reload
  }

  @override
  Future<Either<BaseError, int>> saveUser() async {
    // final data = await appDatabase.userDao.insertData();

    return Right(1);
  }

  //  appDatabase.userDao.insertData(UserDBEntity());
}
