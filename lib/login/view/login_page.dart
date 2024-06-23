import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:five_chat_app/l10n/l10n.dart';
import 'package:five_chat_app/login/cubit/login_cubit.dart';
import 'package:five_chat_app/login/widgets/delayed_display.dart';
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

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        return Scaffold(
          backgroundColor: theme.canvasColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
              child: Column(
                children: [
                  const _AnimatedTitle(),
                  const Spacer(),
                  DelayedDisplay(
                    delay: const Duration(seconds: 8),
                    child: SlideTransitionArea(
                      child: _LoginWithButton(
                        title: l10n.loginWithGoogle,
                        onTap: () => null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 8500),
                    child: SlideTransitionArea(
                      child: _LoginWithButton(
                        title: l10n.loginWithApple,
                        onTap: () => null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  DelayedDisplay(
                    delay: const Duration(seconds: 9),
                    child: SlideTransitionArea(
                      child: _LoginWithButton(
                        title: l10n.loginWithEmail,
                        onTap: () => null,
                      ),
                    ),
                  ),
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
    final l10n = context.l10n;
    return SizedBox(
      width: double.infinity,
      child: AnimatedTextKit(
        isRepeatingAnimation: false,
        animatedTexts: [
          TyperAnimatedText(
            l10n.loginHello,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 50,
            ),
            speed: const Duration(
              milliseconds: 300,
            ),
          ),
          TyperAnimatedText(
            l10n.loginDescription,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 35,
            ),
            speed: const Duration(
              milliseconds: 85,
            ),
          ),
        ],
      ),
    );
  }
}

class SlideTransitionArea extends StatefulWidget {
  const SlideTransitionArea({required this.child, super.key});

  final Widget child;

  @override
  State<SlideTransitionArea> createState() => _SlideTransitionAreaState();
}

class _SlideTransitionAreaState extends State<SlideTransitionArea>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  late final Animation<Offset> _offsetAnimation =
      Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero).animate(
    CurvedAnimation(parent: controller, curve: Curves.easeInOut),
  );

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _LoginWithButton extends StatelessWidget {
  const _LoginWithButton({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 65,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withAlpha(200),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: FilledButton(
        onPressed: onTap,
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 23,
              fontFamily: 'Nunito',
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(theme.canvasColor),
          foregroundColor:
              WidgetStateProperty.all<Color>(theme.colorScheme.onSurface),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: theme.colorScheme.onSurface,
                width: 2,
              ),
            ),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
