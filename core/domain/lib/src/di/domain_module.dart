import 'package:domain/domain.dart';
import 'package:domain/src/repository/image_picker_repository.dart';
import 'package:domain/src/repository/langauge_repository.dart';
import 'package:domain/src/repository/my_posts_repository.dart';
import 'package:domain/src/usecase/user/pick_image_use_case.dart';
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
}
