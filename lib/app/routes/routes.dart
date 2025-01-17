import 'package:five_chat_app/login/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: LoginPage.routePath,
  routes: <RouteBase>[_loginRoute],
);

final _loginRoute = GoRoute(
  path: LoginPage.routePath,
  builder: (BuildContext context, GoRouterState state) => const LoginPage(),
);
