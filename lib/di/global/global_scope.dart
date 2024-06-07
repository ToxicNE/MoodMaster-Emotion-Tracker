import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/data/source/auth_rds/auth_rds.dart';
import 'package:moodmaster/data/source/in_app_auth_rds/in_app_auth_rds.dart';
import 'package:moodmaster/di/app_async_dependency.dart';
import 'package:moodmaster/domain/auth_repository/auth_repository.dart';
import 'package:moodmaster/domain/in_app_auth_repository/in_app_auth_repository.dart';
import 'package:moodmaster/navigation/app_router.dart';
import 'package:moodmaster/navigation/guard/auth_guard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/source/mood_rds/mood_rds.dart';
import '../../domain/mood_repository/mood_repository.dart';

class GlobalDependency extends AppAsyncDependency {
  late final AuthRepository authRepository;

  late final AuthGuard authGuard;

  late final AppRouter router;

  late final AuthRDS authRDS;

  late final SharedPreferences sharedPreferences;

  late final InAppAuthRds inAppAuthRDS;

  late final InAppAuthRepository inAppAuthRepository;

  late final MoodRDS moodRDS;

  late final MoodRepository moodRepository;

  @override
  Future<void> initAsync(BuildContext context) async {
    sharedPreferences = await SharedPreferences.getInstance();
    inAppAuthRDS = InAppAuthRds(sharedPreferences: sharedPreferences);
    authGuard = AuthGuard(inAppAuthRDS: inAppAuthRDS);
    router = AppRouter(authGuard: authGuard);
    authRDS = AuthRDS(firebaseAuth: FirebaseAuth.instance, sharedPreferences: sharedPreferences);
    authRepository = AuthRepository(authRDS: authRDS);
    inAppAuthRepository = InAppAuthRepository(inAppAuthRDS: inAppAuthRDS, router: router);
    moodRDS = MoodRDS(sharedPreferences: sharedPreferences);
    moodRepository = MoodRepository(moodRDS: moodRDS);

    moodRepository.setNotifierValue();
  }
}

extension DepContextExtension on BuildContext {
  GlobalDependency get global => read<GlobalDependency>();
}
