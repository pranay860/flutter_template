import 'package:domain/domain.dart';

abstract class DatabasePort {
  Future<Either<BaseError, int>> saveUser();
  void fetchAllUsers();
  void reload();
}
