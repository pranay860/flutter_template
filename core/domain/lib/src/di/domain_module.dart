import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  ///
  @lazySingleton
  UserUseCase createUserRepositoryProvider(UserRepository userRepository) {
    return UserUseCase(userRepository);
  }

  @lazySingleton
  LanguageUseCase createLanguageRepositoryProvider(
      LanguageRespository languageRespository) {
    return LanguageUseCase(languageRespository);
  }

  @lazySingleton
  ImageUseCase createImageUseCaseRepositoryProvider(
      ImageRepository imageRepository) {
    return ImageUseCase(imageRepository);
  }

  @lazySingleton
  MyPostsUseCase createMyPostsUseCaseRepositoryProvider(
      MyPostRepository myPostRepository) {
    return MyPostsUseCase(myPostRepository);
  }

  @lazySingleton
  GetUserDataUseCase createGetUserDataRepositoryProvider(
      CloudDbRepository cloudDbRepository) {
    return GetUserDataUseCase(cloudDbRepository);
  }

  @lazySingleton
  SaveUserDataUseCase createUserDataRepositoryProvider(
      CloudDbRepository cloudDbRepository) {
    return SaveUserDataUseCase(cloudDbRepository);
  }
}
