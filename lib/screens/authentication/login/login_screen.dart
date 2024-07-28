import 'package:flutter/material.dart';
import 'package:pingokart/provider/auth_provider.dart';
import 'package:pingokart/routes/routes.dart';
import 'package:pingokart/screens/authentication/login/login_form_controller.dart';
import 'package:pingokart/services/navigation_service.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/constants/image_constants.dart';
import 'package:pingokart/utils/size.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static final LoginFormController _controller = LoginFormController();

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstants.logo,
                  height: SizeConfig.height * 0.14,
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Pingokart',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Form(
              key: _controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _controller.emailController,
                    focusNode: _controller.emailFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: _controller.validateEmail,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_controller.passwordFocusNode);
                    },
                  ),
                  const SizedBox(height: 16),
                  ValueListenableBuilder<bool>(
                    valueListenable: _controller.passwordObscure,
                    builder: (context, obscureText, child) {
                      return TextFormField(
                        controller: _controller.passwordController,
                        focusNode: _controller.passwordFocusNode,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: _controller.togglePasswordVisibility,
                          ),
                        ),
                        validator: _controller.validatePassword,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _controller.login(),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password ?',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: TColors.primaryColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, child) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: authProvider.isLoading
                              ? null
                              : () {
                                  _controller.login();
                                  FocusScope.of(context).unfocus();
                                },
                          child: authProvider.isLoading
                              ? const SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('Login'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ?"),
                      TextButton(
                        onPressed: () {
                          NavigationService.navigateTo(AppRoutes.register);
                        },
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
