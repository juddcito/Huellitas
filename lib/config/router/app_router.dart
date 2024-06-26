

import 'package:flutter_huellitas_lm/presentation/screens/home_screen.dart';
import 'package:flutter_huellitas_lm/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen()
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen()
    ),

  ]
);