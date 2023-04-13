import 'package:data/data.dart';
import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';

import '../constants/database_tables.dart';

@Entity(tableName: Table.user, indices: [
  Index(value: ['email', "firstName", "lastName"], unique: true),
])
class UserDBEntity extends BaseLayerDataTransformer<UserDBEntity, User> {
  @primaryKey
  String? email;
  String? firstName;
  String? lastName;
  // UserDBEntity(this.email, this.firstName, this.lastName);
}
