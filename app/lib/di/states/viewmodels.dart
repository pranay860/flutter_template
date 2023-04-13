import 'package:app/dependencies.dart';
import 'package:app/feature/posts/my_post_page_model.dart';
import 'package:app/feature/user_page_view_model.dart';
import 'package:app/feature/splash/splash_page_model.dart';

import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain/domain.dart';

final splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
  (ref) => SplashViewModel(getIt.get<String>(instanceName: "BaseUrl"),
      getIt.get<FlutterExceptionHandlerBinder>()),
);

final userPageViewModelProvider = ChangeNotifierProvider<UserPageViewModel>(
    (ref) => UserPageViewModel(
        getIt.get<UserUseCase>(),
        getIt.get<LanguageUseCase>(),
        getIt.get<ImageUseCase>(),
        getIt.get<GetUserDataUseCase>(),
        getIt.get<SaveUserDataUseCase>()));

final myPostsViewModel = ChangeNotifierProvider<MyPostsViewModel>((ref) =>
    MyPostsViewModel(getIt.get<MyPostsUseCase>(),
        getIt.get<FlutterExceptionHandlerBinder>()));
