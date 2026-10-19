
Future<String> buscarDados() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Dados carregados';
}

Future<void> main() async {
  print('Iniciando operação...');

  try {
    String resultado = await buscarDados();
    print(resultado);
  } catch (erro) {
    print('Ocorreu um erro: $erro');
  }

  print('Programa finalizado.');
}
