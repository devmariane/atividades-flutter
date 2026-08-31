/*3. Escreva um programa em Dart para criar uma classe Laptop com as propriedades [id, nome, ram, clockCpu] e crie 3 objetos dela,
imprimindo todos os detalhes.*/ 
class Laptop {
  int id;
  String nome;
  String ram;
  double clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);
}

void main() {
  Laptop laptop1 = Laptop(1, "Dell Inspiron", "16GB", 2.5);
  Laptop laptop2 = Laptop(2, "HP Pavilion", "8GB", 2.3);
  Laptop laptop3 = Laptop(3, "Lenovo ThinkPad", "32GB", 2.8);

  print("Detalhes do Laptop 1:");
  print("ID: ${laptop1.id}");
  print("Nome: ${laptop1.nome}");
  print("RAM: ${laptop1.ram}");
  print("Clock CPU: ${laptop1.clockCpu}");

  print("\nDetalhes do Laptop 2:");
  print("ID: ${laptop2.id}");
  print("Nome: ${laptop2.nome}");
  print("RAM: ${laptop2.ram}");
  print("Clock CPU: ${laptop2.clockCpu}");

  print("\nDetalhes do Laptop 3:");
  print("ID: ${laptop3.id}");
  print("Nome: ${laptop3.nome}");
  print("RAM: ${laptop3.ram}");
  print("Clock CPU: ${laptop3.clockCpu}");
}