import 'package:data/data.dart';
import 'package:firebase/firebase_adapter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  /// To initlize firebase adapter
  @singleton
  FirebasePort provideFirebasePort() => FirebaseAdapter();
}
