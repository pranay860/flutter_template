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
    (ref) => UserPageViewModel(getIt.get<UserUseCase>(),
        getIt.get<LanguageUseCase>(), getIt.get<ImageUseCase>()));

///
final myPostsViewModel = ChangeNotifierProvider<MyPostsViewModel>(
    (ref) => MyPostsViewModel(getIt.get<MyPostsUseCase>(),
        getIt.get<FlutterExceptionHandlerBinder>()));

/// This can be a issue let's take example that
/// 
/// I wanted to call an API request and load that
/// data into my listview and I do not wanted to call an API
/// again and again.
/// This can be possible if manipulating the inital data parameter
/// in AppStreamBuilder widget.
/// 
/// But in this scenario when I am calling the API
/// I have to make viewmodel autodiposbile because
/// when the viewmodel get disposed then only the API get 
/// called again when constroctor get called
/// 
/// The scenario should like most off the time 
/// want to call API only once thourgh the app 
/// whenever we open the screen loaded data should 
/// be there without calling an API again and again
/// 
/// This will make minimum API calls 
///
