import 'package:flutter/material.dart';
import 'package:movie_ticket/features/auth/login/presentation/widgets/login_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginWidgets(),
    );
  }
}
