
import 'package:bloc/bloc.dart';
import 'package:expenseapp_bloc/Models/expense_models.dart';
import 'package:meta/meta.dart';

import '../Database/app_database.dart';

part 'exp_event.dart';
part 'exp_state.dart';

class ExpBloc extends Bloc<ExpEvent, ExpState> {
  AppDataBase db ;
  ExpBloc({required this.db}) : super(ExpenseInitialState()) {

    on<AddExpenseEvent>((event, emit) async{
      emit(ExpenseLoadingState());

     var check = await db.addExpense(event.newExpense);

     if(check){
       var mExp = await db.fetchAllExpense();
       emit(ExpenseLoadedState(mData: mExp));
     }else{
       emit(ExpenseErrorState(errormsg: "Expense Not Added"));
     }
    });

    on<UpdateExpenseEvent>((event, emit) {

    });

    on<DeleteExpenseEvent>((event, emit) {

    });

    on<FetchAllExpEvent>((event, emit) async{
      emit(ExpenseLoadingState());
      var mExp= await db.fetchAllExpense();
      emit(ExpenseLoadedState(mData: mExp));
    });
  }
}
