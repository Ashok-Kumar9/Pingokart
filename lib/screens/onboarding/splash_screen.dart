import 'package:flutter/material.dart';
import 'package:pingokart/provider/auth_provider.dart';
import 'package:pingokart/routes/routes.dart';
import 'package:pingokart/services/navigation_service.dart';
import 'package:pingokart/utils/constants/image_constants.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    final authProvider = context.read<AuthProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await authProvider.loadCurrentUser();

      if (mounted) {
        final route =
            authProvider.isLoggedIn ? AppRoutes.navBar : AppRoutes.login;
        NavigationService.navigateTo(route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageConstants.logo,
          fit: BoxFit.contain,
          height: 120,
          width: 120,
        ),
      ),
    );
  }
}
