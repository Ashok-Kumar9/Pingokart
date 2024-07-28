import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingokart/bloc/product_bloc/products_bloc.dart';
import 'package:pingokart/firebase_options.dart';
import 'package:pingokart/provider/auth_provider.dart';
import 'package:pingokart/provider/navbar_navigation_provider.dart';
import 'package:pingokart/provider/remote_config_provider.dart';
import 'package:pingokart/repository/product_repository.dart';
import 'package:pingokart/routes/routes.dart';
import 'package:pingokart/services/navigation_service.dart';
import 'package:pingokart/utils/size.dart';
import 'package:pingokart/utils/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavBarNavigationProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => RemoteConfigProvider()),
        BlocProvider(create: (_) => ProductBloc(ProductService())),
      ],
      child: MaterialApp(
        title: 'Pingokart',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.routes,
      ),
    );
  }
}
