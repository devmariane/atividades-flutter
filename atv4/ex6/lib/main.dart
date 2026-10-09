import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kindacode.com',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListaTarefasPage(),
    );
  }
}

// Modelo para representar uma tarefa
class Tarefa {
  final String id;
  final String titulo;
  bool concluida;

  Tarefa({required this.id, required this.titulo, this.concluida = false});
}

class ListaTarefasPage extends StatefulWidget {
  const ListaTarefasPage({super.key});

  @override
  State<ListaTarefasPage> createState() => _ListaTarefasPageState();
}

class _ListaTarefasPageState extends State<ListaTarefasPage> {
  final List<Tarefa> _tarefas = [];

  // Adiciona uma nova tarefa com a data e hora atual
  void _adicionarTarefa() {
    final agora = DateTime.now();
    final dataFormatada =
        "${agora.year}-${agora.month.toString().padLeft(2, '0')}-${agora.day.toString().padLeft(2, '0')}\n${agora.hour.toString().padLeft(2, '0')}:${agora.minute.toString().padLeft(2, '0')}:${agora.second.toString().padLeft(2, '0')}.${agora.microsecond}";

    setState(() {
      _tarefas.add(
        Tarefa(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          titulo: "Task $dataFormatada",
        ),
      );
    });
  }

  // Alterna o status de conclusão da tarefa
  void _alternarStatusTarefa(Tarefa tarefa, bool? valor) {
    setState(() {
      tarefa.concluida = valor ?? false;
    });
  }

  // Exibe a tela/diálogo com as tarefas concluídas
  void _exibirTarefasConcluidas() {
    final concluidas = _tarefas.where((t) => t.concluida).toList();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Completed Tasks'),
          content: concluidas.isEmpty
              ? const Text('Nenhuma tarefa concluída ainda.')
              : SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: concluidas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        title: Text(concluidas[index].titulo),
                      );
                    },
                  ),
                ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filtra apenas as tarefas pendentes
    final tarefasPendentes = _tarefas.where((t) => !t.concluida).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botão para visualizar tarefas concluídas
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: _exibirTarefasConcluidas,
              child: const Text('View Completed Tasks'),
            ),
            const SizedBox(height: 16),

            // Contado de tarefas pendentes
            Text(
              'You have ${tarefasPendentes.length} uncompleted tasks',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Lista de cartões amarelos das tarefas pendentes
            Expanded(
              child: tarefasPendentes.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhuma tarefa pendente. Clique no + para adicionar.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tarefasPendentes.length,
                      itemBuilder: (context, index) {
                        final tarefa = tarefasPendentes[index];
                        return Card(
                          color: const Color(
                            0xFFFFE066,
                          ), // Cor amarela do layout
                          margin: const EdgeInsets.only(bottom: 12.0),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    tarefa.titulo,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                Checkbox(
                                  value: tarefa.concluida,
                                  activeColor: Colors.blue,
                                  onChanged: (valor) {
                                    _alternarStatusTarefa(tarefa, valor);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      // Botão flutuante para adicionar nova tarefa
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarTarefa,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
