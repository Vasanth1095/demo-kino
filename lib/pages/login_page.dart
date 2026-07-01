import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';
import '../widgets/primary_action_button.dart';
import 'home_shell.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 52, 24, 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppLogo(size: 68),
                const SizedBox(height: 34),
                Text('Welcome back', style: textTheme.headlineLarge),
                const SizedBox(height: 10),
                Text(
                  'Sign in to continue your film queue.',
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 34),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'you@example.com',
                    prefixIcon: Icon(Icons.mail_outline_rounded),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter any password',
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                  ),
                ),
                const SizedBox(height: 28),
                PrimaryActionButton(
                  label: 'Login',
                  icon: Icons.arrow_forward_rounded,
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(HomeShell.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
