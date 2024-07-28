import 'package:flutter/material.dart';
import 'package:pingokart/provider/auth_provider.dart';
import 'package:pingokart/routes/routes.dart';
import 'package:pingokart/services/navigation_service.dart';
import 'package:provider/provider.dart';

class LoginFormController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final passwordObscure = ValueNotifier<bool>(true);

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> login() async {
    if (validateForm()) {
      final authProvider = Provider.of<AuthProvider>(
        NavigationService.navigatorKey.currentContext!,
        listen: false,
      );

      FocusScope.of(NavigationService.navigatorKey.currentContext!).unfocus();

      await authProvider.loginWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      if (authProvider.errorMessage == null) {
        NavigationService.navigateToAndRemoveUntil(
            AppRoutes.navBar, (route) => false);
      } else {
        ScaffoldMessenger.of(
          NavigationService.navigatorKey.currentContext!,
        ).showSnackBar(
          SnackBar(content: Text(authProvider.errorMessage!)),
        );
      }
    }
  }

  void togglePasswordVisibility() {
    passwordObscure.value = !passwordObscure.value;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordObscure.dispose();
  }
}
