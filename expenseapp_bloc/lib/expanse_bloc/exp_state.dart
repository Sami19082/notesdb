part of 'exp_bloc.dart';

@immutable
abstract class ExpState {}

class ExpInitial extends ExpState {}


class ExpenseInitialState extends ExpState{}


class ExpenseLoadingState extends ExpState{

}

class ExpenseLoadedState extends ExpState{
List<ExpenseModel> mData;
ExpenseLoadedState({required this.mData});
}

class ExpenseErrorState extends ExpState{
  String errormsg ;
  ExpenseErrorState({required this.errormsg});
}
