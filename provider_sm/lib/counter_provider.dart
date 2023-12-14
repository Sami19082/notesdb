import 'package:flutter/foundation.dart';

class Counterprovider extends ChangeNotifier{

  List<Map<String,dynamic>> _arrdata = [];

  void adddata(Map<String,dynamic> newdata){
    _arrdata.add(newdata);
    notifyListeners();
  }

  List<Map<String,dynamic>> get mdata => _arrdata;

  int _counter = 0;

  set countvalue(int value){
    _counter = value;
    notifyListeners();
  }

 int get countvalue{
   return _counter;
  }

  int getcount(){
    return _counter;
  }

  void increment(){
    //events
    _counter++;
    notifyListeners();
  }

  void decrement(){
    if (_counter>0){
      _counter--;
      notifyListeners();
    }
  }

}