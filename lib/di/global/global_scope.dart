import 'package:flutter/material.dart';
import 'package:moodmaster/di/app_async_dependency.dart';
import 'package:moodmaster/domain/auth_repository/auth_repository.dart';
import 'package:provider/provider.dart';

class GlobalDependency extends AppAsyncDependency {
  late final AuthRepository authRepository;

  @override
  Future<void> initAsync(BuildContext context) async {
    authRepository = AuthRepository();
  }
}

extension DepContextExtension on BuildContext {
  GlobalDependency get global => read<GlobalDependency>();
}
