/* 1. Crie um programa em Dart para um sistema de cadastro de equipamentos do
IFSP. Use `var` para declarar o nome do equipamento como "Impressora 3D", `String`
para o local como "Lab de Protótipos", e `dynamic` para o número de patrimônio,
inicialmente como `12345`. Em seguida, altere o valor de `patrimonio` para `"12345-A"`
(simulando uma mudança de formato). Por fim, imprima os valores e use o operador `is`
para mostrar o tipo atual de cada variável. Use comentários no código para explicar por que
Dart permite mudar o tipo de patrimonio, mas não de local.*/
void main() {
  var nomeEquipamento = "Impressora 3D"; 
  String local = "Lab de Protótipos"; 
  dynamic patrimonio = 12345;
  patrimonio = "12345-A";
  

  print("--- Dados do Equipamento ---");
  print("Equipamento: $nomeEquipamento");
  print("Local: $local");
  print("Patrimônio: $patrimonio");


  print("\n--- Verificação de Tipos com operador 'is' ---");
  print("nomeEquipamento é String? ${nomeEquipamento is String}");
  print("local é String? ${local is String}");
  print("patrimonio é String? ${patrimonio is String}");
  print("patrimonio é int? ${patrimonio is int}");
}

  /* 
   Por que Dart permite mudar o tipo de patrimonio, mas não de local?

    O Dart permite mudar o tipo de 'patrimonio' porque ela foi declarada como 'dynamic' que indica ao compilador para adiar a verificação de tipo para o tempo de execução, permitindo reatribuir valores de tipos totalmente diferentes, mas sobre o local não é possivel pois o Dart é uma linguagem de tipagem forte e estática. A variável 'local' foi tipada explicitamente como String, enquanto 'nomeEquipamento' teve seu tipo inferido como String pelo uso do 'var'. Em ambos os casos, o tipo fica "travado" após a compilação, impedindo a atribuição de valores de outro tipo 
   */
