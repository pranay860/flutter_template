import 'package:dependency_injection/dependency_injection.dart';
import 'package:firebase/src/di/firebase_dependency_confurigator.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

// global private function
@InjectableInit(initializerName: r'$initFirebaseGetIt')
_configureModuleDependencies(GetIt getIt) => $initFirebaseGetIt(getIt);

class FirebaseDependencyConfurigator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureModuleDependencies(getIt));
  }
}
