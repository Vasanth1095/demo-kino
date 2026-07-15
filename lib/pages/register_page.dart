import 'package:flutter/material.dart';

import '../services/auth_store.dart';
import '../widgets/app_logo.dart';
import '../widgets/primary_action_button.dart';
import 'home_shell.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authStore = AuthStore();

  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    await _authStore.registerUser(
      name: _nameController.text,
      phone: _phoneController.text,
      password: _passwordController.text,
    );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Account created. Welcome to Demo Kino.')),
    );
    Navigator.of(context).pushReplacementNamed(HomeShell.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 52, 24, 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppLogo(size: 68),
                    const SizedBox(height: 34),
                    Text('Create account', style: textTheme.headlineLarge),
                    const SizedBox(height: 10),
                    Text(
                      'Register once, then use your phone number to login next time.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 34),
                    TextFormField(
                      controller: _nameController,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Your full name',
                        prefixIcon: Icon(Icons.person_outline_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().length < 2) {
                          return 'Enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Phone number',
                        hintText: '9876543210',
                        prefixIcon: Icon(Icons.phone_outlined),
                      ),
                      validator: (value) {
                        final phone = value?.trim() ?? '';
                        if (phone.length < 7) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'Set password',
                        hintText: 'At least 6 characters',
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) => _register(),
                    ),
                    const SizedBox(height: 28),
                    PrimaryActionButton(
                      label: _isSaving ? 'Creating account...' : 'Register',
                      icon: Icons.person_add_alt_1_rounded,
                      onPressed: _isSaving ? () {} : _register,
                    ),
                    const SizedBox(height: 18),
                    Center(
                      child: TextButton(
                        onPressed: _isSaving
                            ? null
                            : () => Navigator.of(context).pop(),
                        child: const Text('Already have an account? Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
