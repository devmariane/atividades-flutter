import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
      ),
      home: const TelaResponsiva(),
    );
  }
}

class TelaResponsiva extends StatelessWidget {
  const TelaResponsiva({super.key});
  final List<String> linguagens = const ['Dart', 'JavaScript', 'PHP', 'C++'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Layouts')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _buildPortraitLayout();
          } else {
            return _buildLandscapeLayout();
          }
        },
      ),
    );
  }


  Widget _buildPortraitLayout() {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Cheetah Coding',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
     
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBotao('BUTTON 1'),
            const SizedBox(width: 16),
            _buildBotao('BUTTON 2'),
          ],
        ),
        const SizedBox(height: 20),
      
        Expanded(child: _buildListaLinguagens()),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
      
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Cheetah Coding',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildBotao('BUTTON 1'),
              const SizedBox(height: 12),
              _buildBotao('BUTTON 2'),
            ],
          ),
        ),
       
        const VerticalDivider(color: Colors.white24, width: 1),
        Expanded(child: _buildListaLinguagens()),
      ],
    );
  }

  Widget _buildListaLinguagens() {
    return Column(
      children: linguagens.map((linguagem) {
        return Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.white24, width: 1)),
            ),
            child: Text(linguagem, style: const TextStyle(fontSize: 18)),
          ),
        );
      }).toList(),
    );
  }

  // Widget reutilizável para os botões
  Widget _buildBotao(String texto) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        minimumSize: const Size(120, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onPressed: () {},
      child: Text(texto),
    );
  }
}
