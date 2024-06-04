import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/app/app.dart';
import 'package:moodmaster/di/app_async_dependency.dart';
import 'package:moodmaster/di/global/global_scope.dart';
import 'package:moodmaster/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    AsyncDependencyWidget(
      create: GlobalDependency.new,
      loaderBuilder: (_) => const SizedBox(),
      child: const App(),
    ),
  );
}
