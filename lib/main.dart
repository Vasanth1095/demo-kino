import 'package:flutter/material.dart';
import 'pages/home_shell.dart';
import 'pages/login_page.dart';
import 'pages/splash_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DemoKinoApp());
}

class DemoKinoApp extends StatelessWidget {
  const DemoKinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Kino',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (_) => const SplashPage(),
        LoginPage.routeName: (_) => const LoginPage(),
        HomeShell.routeName: (_) => const HomeShell(),
      },
    );
  }
}
