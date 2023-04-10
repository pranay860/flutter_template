import 'package:dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// global private function
@InjectableInit(initializerName: r'$initFirebaseNetworkGetIt')
_configureModuleDependencies(GetIt getIt) => $initFirebaseNetworkGetIt(getIt);

class FirebaseDependencyConfurigator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureModuleDependencies(getIt));
  }
}
