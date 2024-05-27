import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/data/source/auth_rds/auth_rds.dart';
import 'package:moodmaster/di/app_async_dependency.dart';
import 'package:moodmaster/domain/auth_repository/auth_repository.dart';
import 'package:moodmaster/navigation/app_router.dart';
import 'package:moodmaster/navigation/guard/auth_guard.dart';
import 'package:provider/provider.dart';

class GlobalDependency extends AppAsyncDependency {
  late final AuthRepository authRepository;

  late final AuthGuard authGuard;

  late final AppRouter router;

  late final AuthRDS authRDS;
  @override
  Future<void> initAsync(BuildContext context) async {
    authGuard = AuthGuard();
    router = AppRouter(authGuard: authGuard);
    authRDS = AuthRDS(firebaseAuth: FirebaseAuth.instance);
    authRepository = AuthRepository(authRDS: authRDS);
  }
}

extension DepContextExtension on BuildContext {
  GlobalDependency get global => read<GlobalDependency>();
}
