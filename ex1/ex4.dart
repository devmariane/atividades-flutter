/*4. Utilizando a classe Laptop do exercício anterior, crie 3 named
constructors. Cada um deve criar uma instância de Laptop que configure:• um laptop para somente navegação na internet;• um laptop para uso em escritório;• um laptop para programação.
Você deve decidir quais configurações serão definidas em cada named
constructor. Por fim, crie instâncias de objetos Laptop utilizando cada um dos
named constructor e imprima seus valores no console.*/
class Laptop {
  int id;
  String nome;
  String ram;
  double clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  Laptop.navegacao(int id, String nome, String ram, double clockCpu)
      : this(id, nome, ram, clockCpu);

  Laptop.escritorio(int id, String nome, String ram, double clockCpu)
      : this(id, nome, ram, clockCpu);

  Laptop.programacao(int id, String nome, String ram, double clockCpu)
      : this(id, nome, ram, clockCpu);
}

void main(){

  Laptop laptopNavegacao = Laptop.navegacao(1, "Chromebook", "4GB", 1.6);
  Laptop laptopEscritorio = Laptop.escritorio(2, "Dell Latitude", "8GB", 2.0);
  Laptop laptopProgramacao = Laptop.programacao(3, "MacBook Pro", "16GB", 2.8);

  print("Detalhes do Laptop para Navegação:");
  print("ID: ${laptopNavegacao.id}");
  print("Nome: ${laptopNavegacao.nome}");
  print("RAM: ${laptopNavegacao.ram}");
  print("Clock CPU: ${laptopNavegacao.clockCpu}");

  print("\nDetalhes do Laptop para Escritório:");
  print("ID: ${laptopEscritorio.id}");
  print("Nome: ${laptopEscritorio.nome}");
  print("RAM: ${laptopEscritorio.ram}");
  print("Clock CPU: ${laptopEscritorio.clockCpu}");

  print("\nDetalhes do Laptop para Programação:");
  print("ID: ${laptopProgramacao.id}");
  print("Nome: ${laptopProgramacao.nome}");
  print("RAM: ${laptopProgramacao.ram}");
  print("Clock CPU: ${laptopProgramacao.clockCpu}");
}