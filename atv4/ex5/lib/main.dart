import 'package:flutter/material.dart';

void main() => runApp(const Exercicio5App());

class Exercicio5App extends StatelessWidget {
  const Exercicio5App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaBottomBar(),
    );
  }
}

class TelaBottomBar extends StatefulWidget {
  const TelaBottomBar({super.key});

  @override
  State<TelaBottomBar> createState() => _TelaBottomBarState();
}

class _TelaBottomBarState extends State<TelaBottomBar> {
  void _mostrarNovasOpcoes() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.create),
                title: const Text('Nova Anotação'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Tirar Foto'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomBar com FAB')),
      body: const Center(child: Text('Conteúdo da Tela')),

      // Configuração do FAB
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarNovasOpcoes,
        child: const Icon(Icons.add),
      ),
      // Posiciona o FAB no centro da barra inferior
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Configuração da BottomBar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            const SizedBox(width: 48), // Espaço para o FAB no meio
            IconButton(icon: const Icon(Icons.person), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
