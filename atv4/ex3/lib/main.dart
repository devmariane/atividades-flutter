import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

const vermelho = Colors.red;
const verde = Colors.green;
const azul = Colors.blue;
const textoGrande = TextStyle(fontSize: 30);

// Aliases para manter compatibilidade com o código dos exemplos.
const red = Colors.red;
const green = Colors.green;
const blue = Colors.blue;
const big = textoGrande;

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemplos de Constraints',
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int exemplo = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplos de Constraints')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: DropdownButton<int>(
              value: exemplo,
              isExpanded: true,
              items: List.generate(
                29,
                (i) => DropdownMenuItem(
                  value: i + 1,
                  child: Text('Exemplo ${i + 1}'),
                ),
              ),
              onChanged: (valor) {
                if (valor != null) {
                  setState(() => exemplo = valor);
                }
              },
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.hardEdge,
              child: mostrarExemplo(exemplo),
            ),
          ),
          const Padding(padding: EdgeInsets.all(12)),
        ],
      ),
    );
  }

  Widget comDescricao(int numero, String descricao, Widget exemplo) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Exemplo $numero: $descricao',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13),
          ),
        ),
        Expanded(child: exemplo),
      ],
    );
  }

  Widget mostrarExemplo(int numero) {
    switch (numero) {
      case 1:
        return comDescricao(
          1,
          'Container sem tamanho fixo: ocupa o espaço disponível do pai.',
          Container(color: red),
        );

      case 2:
        return comDescricao(
          2,
          'Container com 100x100: tamanho fixo definido.',
          Container(width: 100, height: 100, color: red),
        );

      case 3:
        return comDescricao(
          3,
          'Center centraliza o quadrado vermelho no meio da tela.',
          Center(child: Container(width: 100, height: 100, color: red)),
        );

      case 4:
        return comDescricao(
          4,
          'Align com bottomRight posiciona no canto inferior direito.',
          Align(
            alignment: Alignment.bottomRight,
            child: Container(width: 100, height: 100, color: red),
          ),
        );

      case 5:
        return comDescricao(
          5,
          'Container preenchendo todo o espaço disponível dentro do pai.',
          Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: red,
            ),
          ),
        );

      case 6:
        return comDescricao(
          6,
          'Center com container sem tamanho fixo: ocupa o espaço do pai.',
          Center(child: Container(color: red)),
        );

      case 7:
        return comDescricao(
          7,
          'Container pai vermelho com filho verde dentro da área do pai.',
          Center(
            child: Container(
              color: red,
              child: Container(color: green, width: 30, height: 30),
            ),
          ),
        );

      case 8:
        return comDescricao(
          8,
          'Padding cria espaço interno; o filho verde fica afastado da borda.',
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: red,
              child: Container(color: green, width: 30, height: 30),
            ),
          ),
        );

      case 9:
        return comDescricao(
          9,
          'ConstrainedBox força o mínimo e máximo de largura/altura.',
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 70,
              minHeight: 70,
              maxWidth: 150,
              maxHeight: 150,
            ),
            child: Container(color: red, width: 10, height: 10),
          ),
        );

      case 10:
        return comDescricao(
          10,
          'ConstrainedBox centralizado: limites aplicados ao filho.',
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 70,
                minHeight: 70,
                maxWidth: 150,
                maxHeight: 150,
              ),
              child: Container(color: red, width: 10, height: 10),
            ),
          ),
        );

      case 11:
        return comDescricao(
          11,
          'Filho maior que o limite: ConstrainedBox corta o tamanho máximo.',
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 70,
                minHeight: 70,
                maxWidth: 150,
                maxHeight: 150,
              ),
              child: Container(color: red, width: 1000, height: 1000),
            ),
          ),
        );

      case 12:
        return comDescricao(
          12,
          'Filho dentro do limite: tamanho aceitável e não é forçado.',
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 70,
                minHeight: 70,
                maxWidth: 150,
                maxHeight: 150,
              ),
              child: Container(color: red, width: 100, height: 100),
            ),
          ),
        );

      case 13:
        return comDescricao(
          13,
          'UnconstrainedBox remove as restrições do pai e deixa o filho crescer livremente.',
          UnconstrainedBox(child: Container(color: red, width: 20, height: 50)),
        );

      case 14:
        return comDescricao(
          14,
          'Filho muito grande: UnconstrainedBox ignora os limites do pai.',
          UnconstrainedBox(
            child: Container(color: red, width: 4000, height: 50),
          ),
        );

      case 15:
        return comDescricao(
          15,
          'OverflowBox permite que o filho transborde a área do pai.',
          OverflowBox(
            minWidth: 0,
            minHeight: 0,
            maxWidth: double.infinity,
            maxHeight: double.infinity,
            child: Container(color: red, width: 4000, height: 50),
          ),
        );

      case 16:
        return comDescricao(
          16,
          'UnconstrainedBox com width infinito pode escapar do limite do pai.',
          UnconstrainedBox(
            child: Container(
              color: Colors.red,
              width: double.infinity,
              height: 100,
            ),
          ),
        );

      case 17:
        return comDescricao(
          17,
          'LimitedBox limita o tamanho máximo, mesmo com largura infinita.',
          UnconstrainedBox(
            child: LimitedBox(
              maxWidth: 100,
              child: Container(
                color: Colors.red,
                width: double.infinity,
                height: 100,
              ),
            ),
          ),
        );

      case 18:
        return comDescricao(
          18,
          'FittedBox ajusta o texto para caber no espaço disponível.',
          const FittedBox(child: Text('Some Example Text.')),
        );

      case 19:
        return comDescricao(
          19,
          'Center + FittedBox: texto centralizado e redimensionado para caber.',
          const Center(child: FittedBox(child: Text('Some Example Text.'))),
        );

      case 20:
        return comDescricao(
          20,
          'Texto muito grande: FittedBox reduz o tamanho para caber.',
          const Center(
            child: FittedBox(
              child: Text(
                'This is some very very very large text that is too big to fit a regular screen in a single line.',
              ),
            ),
          ),
        );

      case 21:
        return comDescricao(
          21,
          'Texto longo sem FittedBox: não ajusta automaticamente.',
          const Center(
            child: Text(
              'This is some very very very large text that is too big to fit a regular screen in a single line.',
            ),
          ),
        );

      case 22:
        return comDescricao(
          22,
          'FittedBox ajusta um container com largura infinita.',
          FittedBox(
            child: Container(
              height: 20,
              width: double.infinity,
              color: Colors.red,
            ),
          ),
        );

      case 23:
        return comDescricao(
          23,
          'Row coloca os filhos lado a lado na mesma linha.',
          Row(
            children: [
              Container(
                color: red,
                child: const Text('Hello!', style: big),
              ),
              Container(
                color: green,
                child: const Text('Goodbye!', style: big),
              ),
            ],
          ),
        );

      case 24:
        return comDescricao(
          24,
          'Row com texto longo: o conteúdo pode estourar o espaço da linha.',
          Row(
            children: [
              Container(
                color: red,
                child: const Text(
                  'This is a very long text that '
                  'won\'t fit the line.',
                  style: big,
                ),
              ),
              Container(
                color: green,
                child: const Text('Goodbye!', style: big),
              ),
            ],
          ),
        );

      case 25:
        return comDescricao(
          25,
          'Expanded força o primeiro filho a ocupar o espaço restante.',
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    color: red,
                    child: const Text(
                      'This is a very long text that won\'t fit the line.',
                      style: big,
                    ),
                  ),
                ),
              ),
              Container(
                color: green,
                child: const Text('Goodbye!', style: big),
              ),
            ],
          ),
        );

      case 26:
        return comDescricao(
          26,
          'Dois Expanded dividem a linha em partes iguais.',
          Row(
            children: [
              Expanded(
                child: Container(
                  color: red,
                  child: const Text(
                    'This is a very long text that won\'t fit the line.',
                    style: big,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: green,
                  child: const Text('Goodbye!', style: big),
                ),
              ),
            ],
          ),
        );

      case 27:
        return comDescricao(
          27,
          'Flexible distribui espaço sem forçar uma divisão rígida.',
          Row(
            children: [
              Flexible(
                child: Container(
                  color: red,
                  child: const Text(
                    'This is a very long text that won\'t fit the line.',
                    style: big,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  color: green,
                  child: const Text('Goodbye!', style: big),
                ),
              ),
            ],
          ),
        );

      case 28:
        return comDescricao(
          28,
          'Scaffold com Container azul e Column: conteúdo simples preenchendo a área.',
          Scaffold(
            body: Container(
              color: blue,
              child: const Column(children: [Text('Hello!'), Text('Goodbye!')]),
            ),
          ),
        );

      case 29:
        return comDescricao(
          29,
          'SizedBox.expand força o filho a preencher toda a tela.',
          Scaffold(
            body: SizedBox.expand(
              child: Container(
                color: blue,
                child: const Column(
                  children: [Text('Hello!'), Text('Goodbye!')],
                ),
              ),
            ),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
