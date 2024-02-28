//ALGORITMO QUE EXIBE A TABUADA DO 2 AO 10

void main() {
  for (var i = 2; i <= 10; i++) {
    print('Tabuada do $i:');
    for (var j = 1; j <= 10; j++) {
      var result = i * j;
      print('$i x $j = $result');
    }
    print('');
  }
}
