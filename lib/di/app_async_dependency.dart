import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

abstract class AppAsyncDependency extends AppDependency {
  final Completer<void> _inited = Completer();
  @override
  void init(BuildContext context) {
    initAsync(context).then((value) => _inited.complete()).onError((error, stackTrace) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: stackTrace);
      _inited.completeError(error ?? '');
    });
  }

  Future<void> initAsync(BuildContext context);
}

abstract class AppDependency extends ChangeNotifier {
  void init(BuildContext context);

  static T of<T extends AppDependency>(BuildContext context) => context.read<T>();

  static T depend<T extends AppDependency>(BuildContext context) => context.watch<T>();
}

class AsyncDependencyWidget<T extends AppAsyncDependency> extends ChangeNotifierProvider<T>
    implements AutoRouteWrapper {
  AsyncDependencyWidget({
    super.key,
    required T Function() create,
    required WidgetBuilder loaderBuilder,
    WidgetBuilder? errorBuilder,
    required super.child,
  }) : super(
          create: (context) => create()..init(context),
          builder: (context, child) => FutureBuilder(
            future: context.read<T>()._inited.future,
            builder: (context, snap) {
              if (snap.connectionState != ConnectionState.done) {
                return loaderBuilder(context);
              }
              if (snap.hasError && errorBuilder != null) {
                return errorBuilder(context);
              }
              return child!;
            },
          ),
        );

  @override
  Widget wrappedRoute(BuildContext context) => this;
}

class AsyncLoadingFadeDependencyWidget<T extends AppAsyncDependency> extends ChangeNotifierProvider<T>
    implements AutoRouteWrapper {
  AsyncLoadingFadeDependencyWidget({
    super.key,
    required T Function() create,
    required WidgetBuilder loaderBuilder,
    required super.child,
  }) : super(
          create: (context) => create()..init(context),
          builder: (context, child) => FutureBuilder(
            future: context.read<T>()._inited.future,
            builder: (context, snap) {
              final isLoading = snap.connectionState != ConnectionState.done;
              final showLoadingWidget = ValueNotifier<bool>(isLoading);
              return Material(
                color: Colors.transparent,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Stack(
                    children: [
                      if (isLoading)
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                        )
                      else
                        child!,
                      ValueListenableBuilder(
                        valueListenable: showLoadingWidget,
                        builder: (context, value, child) {
                          if (value) {
                            return IgnorePointer(
                              child: AnimatedOpacity(
                                opacity: isLoading ? 1 : 0,
                                duration: const Duration(milliseconds: 100),
                                child: loaderBuilder(context),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );

  @override
  Widget wrappedRoute(BuildContext context) => this;
}
