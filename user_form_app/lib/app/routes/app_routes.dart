import 'package:flutter/cupertino.dart';
import 'package:my_app/app/feature/user_form/address/address_page.dart';
import 'package:my_app/app/feature/user_form/address/address_page_view.dart';
import 'package:my_app/app/feature/user_form/eduction/education_page.dart';
import 'package:my_app/app/feature/user_form/user/user_page_view.dart';
import 'package:my_app/app/feature/user_form/eduction/education_page_view.dart';
import 'package:my_app/app/feature/user_form/user/user_page.dart';
import 'package:my_app/app/routes/route_paths.dart';

/// This class is for navigation purpose
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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

      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
