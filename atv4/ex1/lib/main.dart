import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaGrid(),
    );
  }
}

class TelaGrid extends StatelessWidget {
  const TelaGrid({super.key});

  // Lista de URLs das imagens
  final List<String> imagensUrl = const [
    'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4d/Cat_November_2010-1a.jpg/250px-Cat_November_2010-1a.jpg?utm_source=pt.wikipedia.org&utm_campaign=parser&utm_content=thumbnail',
    'https://upload.wikimedia.org/wikipedia/commons/b/b9/BLACK-CAT-SITIA-CRETE.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfpXTrTth2W-SjqzRYmI26ntaMQaHLUKjaljMg-gwJXwDNSWPybxO_YrM&s=10',
    'https://upload.wikimedia.org/wikipedia/commons/7/74/%D0%A2%D0%B0%D0%B9%D1%81%D0%BA%D0%B0%D1%8F_%D0%BA%D0%BE%D1%88%D0%BA%D0%B0_%D0%A1%D0%B8%D0%BD%D0%BA%D0%B0_%D0%A2%D0%B0%D0%B9%D0%BD%D0%B0_%D0%A2%D0%B0%D1%83%D0%BD%2C_WCF%2C_%D0%BE%D0%BA%D1%80%D0%B0%D1%81_%D1%81%D0%B8%D0%BB_%D0%BF%D0%BE%D0%B8%D0%BD%D1%82.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH0CC5SdM8bpM1fV3zBAEgpya_T5eguo_ORSP57-i_SQDB60-NVDEkK-w&s=10',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO-DrO6qY1kReialqcN1fv_kSQDDJQHer5HldhCslMnaAbMOrBtAS7ISw&s=10', 
  ];

  // Lista com as descrições correspondentes
  final List<String> titulos = const [
    'gato rajado\nthomas',
    'gato preto\nfernet',
    'gato laranja\nlaranjinha',
    'gato persa\npinhata',
    'gato cinza\ncalido',
    'gato frajola\nsherida',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 1 - GridView'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: imagensUrl.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Stack(
                children: [
                  // 1. Imagem que preenche todo o card
                  Image.network(
                    imagensUrl[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),

                  // 2. Faixa preta transparente posicionada no rodapé
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black.withOpacity(0.5), // Fundo preto com 50% de transparência
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        titulos[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


