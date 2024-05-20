import 'package:flutter/material.dart';
import 'package:moodmaster/app/app.dart';
import 'package:moodmaster/di/app_async_dependency.dart';
import 'package:moodmaster/di/global/global_scope.dart';

void main() {
  runApp(
    AsyncDependencyWidget(
      create: GlobalDependency.new,
      loaderBuilder: (_) => const SizedBox(),
      child: const App(),
    ),
  );
}
