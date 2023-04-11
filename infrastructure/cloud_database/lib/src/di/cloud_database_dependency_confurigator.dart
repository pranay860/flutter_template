import 'package:cloud_database/src/di/cloud_database_dependency_confurigator.config.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

// global private function
@InjectableInit(initializerName: r'$initCloudDbGetIt')
_configureModuleDependencies(GetIt getIt) => $initCloudDbGetIt(getIt);

class CloudDbDependencyConfurigator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureModuleDependencies(getIt));
  }
}
