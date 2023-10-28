import 'dart:io';
// void main() {
//   stdout.write('enter a number till which you wanna print the fabbonaci numbers: ');
//   int fab = int.parse(stdin.readLineSync().toString());
//   List<int> fablist = [];
//   int n1 = 0;
//   int n2 = 1;
//
//
//     while (n1+n2 <= fab) {
//       int n3 = n1 + n2;
//       fablist.add(n3);
//       n1 = n2;
//       n2 = n3;
//
//
//     }
// print(fablist);}

  /// to check if it is a fab or not///
  void main() {
    stdout.write('enter a number to check if it is a febonaci');
    int feb = int.parse(stdin.readLineSync().toString());
    List<int>feblist = [];
    int a1 = 0;
    int a2 = 1;
    int a3 = 0;
    while (a1 + a2 <= feb) {
      a3 = a1 + a2;
      feblist.add(a3);
      a1 = a2;
      a2 = a3;
    }
    if (a3 == feb) {
      print('it is a fab number');
    } else {
      print('it is not a fab number');
    }
  }

 
  


  
  
  


