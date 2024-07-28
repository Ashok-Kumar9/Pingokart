import 'package:flutter/material.dart';
import 'package:pingokart/navbar_menu.dart';
import 'package:pingokart/screens/authentication/login/login_screen.dart';
import 'package:pingokart/screens/authentication/register/register_screen.dart';
import 'package:pingokart/screens/onboarding/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String navBar = '/nav-bar';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        login: (context) => const LoginScreen(),
        register: (context) => const RegisterScreen(),
        navBar: (context) => const NavBarMenu(),
      };
}
