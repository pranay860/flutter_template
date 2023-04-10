import 'package:app/firebase_options.dart';
import 'package:app/myapp.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dependencies.dart';

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    configureDependencies(DependencyConfigurationContext())
  ]);
  runApp(const ProviderScope(child: MyApp()));
}
