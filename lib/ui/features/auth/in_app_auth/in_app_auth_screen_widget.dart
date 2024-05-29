import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/ui/features/auth/in_app_auth/in_app_auth_screen_wm.dart';

@RoutePage()
class InAppAuthScreen extends ElementaryWidget<IInAppAuthScreenWidgetModel> {
  const InAppAuthScreen({super.key})
      : super(defaultInAppAuthScreenWidgetModelFactory);

  @override
  Widget build(IInAppAuthScreenWidgetModel wm) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('A little more about you'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                controller: wm.nameController,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Surname',
                ),
                controller: wm.surnameController,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Avatar URL',
                ),
                controller: wm.avatarUrlController,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => wm.endLogin,
                child: const Text('Done'),
              ),
            ],
          ),
        ));
  }
}
