import 'package:acres/provider/auth_provider.dart';
import 'package:acres/screens/home.dart';
import 'package:acres/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(observers: [], child: MyApp()));
}

final goRoutes = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(1, 0, 106, 194)),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansOldPersianTextTheme(),
      ),
      routerConfig: GoRouter(
        initialLocation: "/login",
        redirect: (context, state) {
          if (ref.watch(authProvider)['isLoggedin']!) {
            return "/";
          }
          return '/login';
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: '/login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
          ),
        ],
      ),
    );
  }
}
