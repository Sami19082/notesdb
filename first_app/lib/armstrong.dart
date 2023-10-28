// import 'dart:io';
// import 'dart:math';
// void main(){
//   stdout.write('enter a number before to  show armstrong numbers');
//   int arm= int.parse(stdin.readLineSync().toString());
//   List<int>arms=[];
//   for(int i=1;i<=arm;i++){
//     if(armstrong().checkarms(i)){
//       arms.add(i);
//     }
//
//   }
// print(arms);
// }
// class armstrong {
//     bool checkarms(int no) {
//       int temp = no;
//       int length = 0;
//       while (temp > 0) {
//         temp = temp ~/ 10;
//         length++;
//       }
//       temp = no;
//       int rem = 0;
//       int result = 0;
//       while (temp > 0) {
//         rem = temp % 10;
//         temp = temp ~/ 10;
//         result = result + pow(rem, length).toInt();
//       }
//       return result == no;
//     }
//   }

/// in terms


import 'dart:io';
import 'dart:math';

  void main(){
    stdout.write('enter the term of amrstrong number');
    int term = int.parse(stdin.readLineSync().toString());
    int no=1;
    List<int> arms=[];
    while(arms.length<term){
      if (armstrong().checkarms(no)){
        arms.add(no);
      }
      no++;

    }
print(arms);
}
class armstrong{
    bool checkarms(int a){
      int temp = a;
      int length = 0;
      while(temp>0){
        temp= temp~/10;
        length++;
      }
      temp=a;
      int rem= 0;
      int result = 0;
      while(temp>0){
        rem= temp%10;
        temp= temp~/10;
        result= result+ pow(rem, length).toInt();
      }
      return result==a;
    }

}
  