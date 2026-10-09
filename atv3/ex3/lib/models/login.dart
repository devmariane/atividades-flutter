class Login {
  final String usuario;
  final String senha;

  Login({required this.usuario, required this.senha});

  bool validar() {
    return usuario == 'admin' && senha == '1234';
  }
}
