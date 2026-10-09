import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController usuarioController;
  final TextEditingController senhaController;
  final VoidCallback onLogin;

  const LoginForm({
    super.key,
    required this.usuarioController,
    required this.senhaController,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: usuarioController,
          decoration: const InputDecoration(
            labelText: 'Usuário',
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 16),

        TextField(
          controller: senhaController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Senha',
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 24),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onLogin, 
            style: ElevatedButton.styleFrom(
              backgroundColor: CupertinoColors.activeBlue, 
              foregroundColor:
                  Colors.white, 
            ),
            child: const Text('LOGIN')),
        ),
      ],
    );
  }
}
