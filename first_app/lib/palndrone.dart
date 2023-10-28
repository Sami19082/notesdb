import 'dart:ffi';
import 'dart:io';


void main() {
  stdout.write('enter the term');
  int pal = int.parse(stdin.readLineSync().toString());
  List<int> palmap=[];
  int i =1;
  while (palmap.length < pal) {
    if(palindrome().checkpalin(i)){
      palmap.add(i);
    }
i++;
  }
  print(palmap);
}

class palindrome{
  bool checkpalin(int a){
    int temp= a;
    int rem=0;
    int res= 0;
    while(temp>0){
      rem= temp%10;
      res= res*10+rem;
      temp= temp~/10;
    }
    return a==res;
   
  }

}