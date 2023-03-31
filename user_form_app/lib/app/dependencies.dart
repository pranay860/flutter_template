import 'package:database_floor/floor.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/app/di/data_dependency_configurator.dart';
import 'package:themes/themes.dart';

final getIt = GetIt.instance;

// configureModulesDependencies imported from feature_module
final configurators = [
  //configure themes
  ThemesDependencyConfigurator(),

  //configure database sources
  DatabaseDependencyConfigurator(),

  DataDependencyConfigurator(),
];

Future configureDependencies(DependencyConfigurationContext context) async {
  for (var configurator in configurators) {
    await configurator.configureDependencies(context, getIt);
  }
}
