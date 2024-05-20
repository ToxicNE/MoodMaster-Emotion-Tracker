import 'package:flutter/material.dart';
import 'package:moodmaster/di/app_async_dependency.dart';
import 'package:moodmaster/domain/auth_repository/auth_repository.dart';
import 'package:moodmaster/navigation/app_router.dart';
import 'package:moodmaster/navigation/guard/auth_guard.dart';
import 'package:provider/provider.dart';

class GlobalDependency extends AppAsyncDependency {
  late final AuthRepository authRepository;

  late final AuthGuard authGuard;

  late final AppRouter router;

  @override
  Future<void> initAsync(BuildContext context) async {
    authRepository = AuthRepository();
    router = AppRouter(authGuard: authGuard);
  }
}

extension DepContextExtension on BuildContext {
  GlobalDependency get global => read<GlobalDependency>();
}
