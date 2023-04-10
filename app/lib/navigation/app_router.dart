import 'package:app/feature/posts/my_posts_page.dart';
import 'package:app/feature/user_form/address/address_page.dart';
import 'package:app/feature/user_form/education/education_page.dart';
import 'package:app/feature/user_form/user/user_page.dart';
import 'package:flutter/cupertino.dart';

import '../feature/splash/splash_page.dart';
import 'route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return CupertinoPageRoute(
            builder: (context) => const SplashPage(),
            settings: const RouteSettings(name: RoutePaths.splash));
      case RoutePaths.home:
        return CupertinoPageRoute(
            builder: (context) => const UserPage(),
            settings: const RouteSettings(name: RoutePaths.home));
      case RoutePaths.address:
        return CupertinoPageRoute(
            builder: (context) => const AddressPage(),
            settings: const RouteSettings(name: RoutePaths.address));

      case RoutePaths.eduction:
        return CupertinoPageRoute(
            builder: (context) => const EducationPage(),
            settings: const RouteSettings(name: RoutePaths.eduction));
      case RoutePaths.myPosts:
        return CupertinoPageRoute(
            builder: (context) => const MyPostsPage(),
            settings: const RouteSettings(name: RoutePaths.myPosts));
      default:
        // Replace by Empty Page
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
