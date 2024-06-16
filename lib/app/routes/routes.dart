import 'package:five_chat_app/login/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: LoginView.routePath,
  routes: <RouteBase>[_loginRoute],
);

final _loginRoute = GoRoute(
  path: LoginView.routePath,
  builder: (BuildContext context, GoRouterState state) {
    return const LoginView();
  },
);
