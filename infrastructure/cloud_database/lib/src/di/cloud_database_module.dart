import 'package:cloud_database/cloud_adapter.dart';
import 'package:data/data.dart';

import 'package:injectable/injectable.dart';

@module
abstract class CloudModule {
  /// To initlize firebase adapter
  @singleton
  CloudDbPort provideFirebasePort() => CloudDbAdapter();
}
