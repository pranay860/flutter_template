import 'package:flutter/cupertino.dart';
import 'package:my_app/app/feature/user_form/address_screen.dart';
import 'package:my_app/app/feature/user_form/user_page_view.dart';
import 'package:my_app/app/feature/user_form/educational_details_screen.dart';
import 'package:my_app/app/feature/user_form/user_page.dart';
import 'package:my_app/app/routes/route_paths.dart';

/// This class is for navigation purpose
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.home:
        return CupertinoPageRoute(
            builder: (context) =>  const UserPage(),
            settings: const RouteSettings(name: RoutePaths.home));
      case RoutePaths.address:
        return CupertinoPageRoute(
            builder: (context) => const AddressForm(),
            settings: const RouteSettings(name: RoutePaths.address));

      case RoutePaths.eduction:
        return CupertinoPageRoute(
            builder: (context) => const EducationForm(),
            settings: const RouteSettings(name: RoutePaths.eduction));

      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
