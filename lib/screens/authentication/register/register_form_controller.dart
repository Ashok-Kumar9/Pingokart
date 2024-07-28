import 'package:flutter/material.dart';
import 'package:pingokart/provider/auth_provider.dart';
import 'package:pingokart/routes/routes.dart';
import 'package:pingokart/services/navigation_service.dart';
import 'package:provider/provider.dart';

class RegisterFormController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  ValueNotifier<bool> agreeToTermsNotifier = ValueNotifier<bool>(false);
  ValueNotifier<bool> passwordVisibilityNotifier = ValueNotifier<bool>(false);
  ValueNotifier<bool> confirmPasswordVisibilityNotifier =
      ValueNotifier<bool>(false);

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    agreeToTermsNotifier.dispose();
    passwordVisibilityNotifier.dispose();
    confirmPasswordVisibilityNotifier.dispose();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> register(BuildContext context) async {
    if (validateForm()) {
      FocusScope.of(context).unfocus();
      if (!agreeToTermsNotifier.value) {
        ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
            .showSnackBar(
          const SnackBar(
            content: Text('You must agree to the terms and conditions'),
          ),
        );
        return;
      }

      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.registerWithEmailAndPassword(
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (authProvider.errorMessage == null) {
        NavigationService.navigateToAndRemoveUntil(
            AppRoutes.navBar, (route) => false);
      } else {
        ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
            .showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage!),
          ),
        );
      }
    }
  }
}
