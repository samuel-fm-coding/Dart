void main() {
  saudacoes('Samuel', false);
  saudacoes('Samuel Fernandes');
}

void saudacoes(String nome, [bool mostrarAgora=true, String sep='-']){
  print('\n\n' + sep * 50);
  print("Saudações do $nome");
  print('Seja bem-vindo(a)');
  if(mostrarAgora){
    print("Agora são: ${agora()}");
  }
}

String agora(){
  DateTime agora = DateTime.now();
  return agora.toString();
}
