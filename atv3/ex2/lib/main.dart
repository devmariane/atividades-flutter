import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 2 - Tema Sobrescrito',
      debugShowCheckedModeBanner: false,
      // 1. ThemeData inicial da aplicação (Azul)
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: const TelaComTemaSobrescrito(),
    );
  }
}

class TelaComTemaSobrescrito extends StatelessWidget {
  const TelaComTemaSobrescrito({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. O widget Theme sobrescreve o ThemeData inicial apenas para esta subárvore
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.yellow),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exercício 2'),
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
        ),
        body: const Center(
          child: Text(
            'Tema Inicial (Azul) Sobrescrito para Amarelo',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
