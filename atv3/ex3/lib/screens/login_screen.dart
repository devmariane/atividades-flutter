import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/login.dart';
import '../widgets/login_form.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usuarioController = TextEditingController();

  final TextEditingController senhaController = TextEditingController();

  @override
  void dispose() {
    usuarioController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  void realizarLogin() {
    final login = Login(
      usuario: usuarioController.text,
      senha: senhaController.text,
    );

    if (login.validar()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário ou senha inválidos!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CupertinoColors.activeBlue,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Image.asset('assets/logo.png', height: 150),

              const SizedBox(height: 30),

              LoginForm(
                usuarioController: usuarioController,
                senhaController: senhaController,
                onLogin: realizarLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
