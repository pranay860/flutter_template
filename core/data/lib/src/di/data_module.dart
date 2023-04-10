import 'package:data/data.dart';
import 'package:data/src/repository/firebase_repository.dart';
import 'package:data/src/repository/image_picker_repository.dart';
import 'package:data/src/repository/language_repository.dart';
import 'package:data/src/repository/my_posts_repository.dart';
import 'package:data/src/repository/user_repository.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @lazySingleton
  UserRepository userRepositoryProvider(DatabasePort databasePort,
      NetworkPort networkPort, FirebasePort firebasePort) {
    return UserRepositoryImpl(databasePort, networkPort, firebasePort);
  }

  @lazySingleton
  LanguageRespository languageRespositoryProvider() {
    return LanguageRepositoryImpl();
  }

  @lazySingleton
  ImageRepository imageRepositoryRepositoryProvider() {
    return ImagePickerRepositoryImpl();
  }

  @lazySingleton
  MyPostRepository myPostsRepositoryProvider(NetworkPort networkPort) {
    return MyPostsRepositoryImpl(networkPort);
  }

  @lazySingleton
  FirebaseRepository firebsaeRepositoryProvider(FirebasePort firebasePort) {
    return FirebaseRepositoryImpl(firebasePort);
  }
}
