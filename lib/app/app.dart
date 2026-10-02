import 'package:cash_control/core/navigation/navigator_key.dart';
import 'package:cash_control/features/auth/application/auth_notifier.dart';
import 'package:cash_control/features/auth/application/auth_state.dart';
import 'package:cash_control/features/auth/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (previous is AuthStateSuccess && next is AuthStateInitial) {
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false,
        );
      }
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Manrope'),
      home: const Login(),
      navigatorKey: navigatorKey,
    );
  }
}
