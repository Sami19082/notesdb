import 'dart:io';
void main() {
  stdout.write('enter a upper range year to check it is a leap year');
  int upper = int.parse(stdin.readLineSync().toString());

  stdout.write('enter a lower range year to check it is a leap year');
  int lower = int.parse(stdin.readLineSync().toString());
List<int>leaplist=[];
  for (int i = lower; i <= upper; i++) {
if(checkyear(i)){
  leaplist.add(i);
  print(checkyear(i));
}
 }
print(leaplist);
    }
 checkyear(int year){

    // return(year % 4 == 0 && year % 100 != 0 || year % 400 == 0);
  if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0){
    return true;
  }else{
    return false;
  }

}
