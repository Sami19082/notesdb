part of 'exp_bloc.dart';

@immutable
abstract class ExpEvent {}
class AddExpenseEvent extends ExpEvent{
ExpenseModel newExpense;
AddExpenseEvent({required this.newExpense});
}

class DeleteExpenseEvent extends ExpEvent{
  int expenseID;
  DeleteExpenseEvent({required this.expenseID});
}

class UpdateExpenseEvent extends ExpEvent{
  ExpenseModel updatedExpense;
  UpdateExpenseEvent({required this.updatedExpense});
}


class FetchAllExpEvent extends ExpEvent{

}
