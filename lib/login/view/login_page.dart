import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:five_chat_app/l10n/l10n.dart';
import 'package:five_chat_app/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String routePath = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        return Scaffold(
          backgroundColor: theme.canvasColor,
          body: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
              child: Column(
                children: [
                  _AnimatedTitle(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AnimatedTitle extends StatelessWidget {
  const _AnimatedTitle();

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      animatedTexts: [
        TyperAnimatedText(
          context.l10n.loginHello,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 40,
          ),
          speed: const Duration(
            milliseconds: 200,
          ),
        ),
        TyperAnimatedText(
          context.l10n.loginDescription,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 35,
          ),
          speed: const Duration(
            milliseconds: 100,
          ),
        ),
      ],
    );
  }
}
