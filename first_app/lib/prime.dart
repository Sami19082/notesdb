import 'dart:io';

void main() {
  stdout.write('enter count to know the prime numbers');
  int count = int.parse(stdin.readLineSync().toString());
  int a = 2;
  int prime =2;
  int i = prime ~/ 2;

  for (a; a <= i; a++) {
    if (prime % a == 0) {
      stdout.write('*');
    }else {
      stdout.write('$prime');
    }
    while (prime < count) {
      stdout.write(' $prime');
      prime++;
    }
  }
}