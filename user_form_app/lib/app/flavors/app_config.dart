import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/app/dependencies.dart';
import 'package:my_app/app/utils/enums.dart';
import 'package:my_app/my_app.dart';

class AppConfig {
  /// To get flavour like dev, prod
  late Flavours flavour;

  /// To get single instance of the
  /// `AppConfig` class
  AppConfig._();

  /// To get intance of the AppConfig class to access
  /// methods and variables
  static final AppConfig appConfig = AppConfig._();

  /// To initlize the variables
  factory AppConfig({required Flavours flavour}) {
    appConfig.flavour = flavour;

    if (kDebugMode) {
      print(flavour);
    }
    return appConfig;
  }

  /// To create widget
  Widget createApp() {
    return const MyApp();
  }

  /// To run app after intilization
  /// of app
  Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
     await configureDependencies(DependencyConfigurationContext());
    runApp(createApp());
  }
}
