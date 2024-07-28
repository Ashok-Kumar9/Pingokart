import 'package:flutter/material.dart';
import 'package:pingokart/provider/auth_provider.dart';
import 'package:pingokart/screens/authentication/register/register_form_controller.dart';
import 'package:pingokart/services/navigation_service.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/constants/image_constants.dart';
import 'package:pingokart/utils/size.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static final RegisterFormController _controller = RegisterFormController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: TColors.secondaryColor.withOpacity(0.6)),
          onPressed: () {
            NavigationService.goBack();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Register to',
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
                    controller: _controller.nameController,
                    focusNode: _controller.nameFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: _controller.validateName,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_controller.emailFocusNode);
                    },
                  ),
                  const SizedBox(height: 16),
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
                    valueListenable: _controller.passwordVisibilityNotifier,
                    builder: (context, isVisible, child) {
                      return TextFormField(
                        controller: _controller.passwordController,
                        focusNode: _controller.passwordFocusNode,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              _controller.passwordVisibilityNotifier.value =
                                  !isVisible;
                            },
                          ),
                        ),
                        validator: _controller.validatePassword,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(
                              _controller.confirmPasswordFocusNode);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ValueListenableBuilder<bool>(
                    valueListenable:
                        _controller.confirmPasswordVisibilityNotifier,
                    builder: (context, isVisible, child) {
                      return TextFormField(
                        controller: _controller.confirmPasswordController,
                        focusNode: _controller.confirmPasswordFocusNode,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              _controller.confirmPasswordVisibilityNotifier
                                  .value = !isVisible;
                            },
                          ),
                        ),
                        validator: _controller.validateConfirmPassword,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) {
                          _controller.confirmPasswordFocusNode.unfocus();
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ValueListenableBuilder<bool>(
                    valueListenable: _controller.agreeToTermsNotifier,
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          Checkbox(
                            value: _controller.agreeToTermsNotifier.value,
                            fillColor: WidgetStateProperty.all(
                                _controller.agreeToTermsNotifier.value
                                    ? TColors.primaryColor
                                    : null),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: const BorderSide(
                              color: TColors.primaryColor,
                            ),
                            onChanged: (newValue) {
                              _controller.agreeToTermsNotifier.value =
                                  newValue ?? false;
                            },
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'I agree to the ',
                              children: [
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, child) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: authProvider.isLoading
                              ? null
                              : () => _controller.register(context),
                          child: authProvider.isLoading
                              ? const SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('Register'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account ?'),
                      TextButton(
                        onPressed: () {
                          NavigationService.goBack();
                        },
                        child: const Text('Login'),
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
