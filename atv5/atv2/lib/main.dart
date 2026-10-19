Future<String> buscarNomeUsuario() async {
  await Future.delayed(const Duration(seconds: 1));

  throw Exception('Não foi possível buscar o nome do usuário.');
}

Future<String> alterarNomeUsuario() async {
  try {
    return await buscarNomeUsuario();
  } catch (erro) {
    return 'Erro capturado: $erro';
  }
}

Future<void> main() async {
  print('Iniciando operação...');

  String resultado = await alterarNomeUsuario();

  print(resultado);
  print('Operação finalizada.');
}
