import 'package:expenseapp_bloc/Database/app_database.dart';

class DateWiseExpenseModel {
  String date;

  String totalAmt;
  List<ExpenseModel> allTransactions;

  DateWiseExpenseModel(
      {required this.date,
      required this.totalAmt,
      required this.allTransactions});
}

class ExpenseModel {
  int expID;
  int UID;
  String expTitle;
  String expDesc;
  String expTime;
  num expAMT;
  num expBal;
  int expType;
  int expCatType;

  ExpenseModel(
      {required this.expID,
      required this.UID,
      required this.expTitle,
      required this.expDesc,
      required this.expTime,
      required this.expAMT,
      required this.expBal,
      required this.expType,
      required this.expCatType});

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
        expID: map[AppDataBase.EXPENSE_ID],
        UID: map[AppDataBase.USER_ID],
        expTitle: map[AppDataBase.EXPENSE_TITLE],
        expDesc: map[AppDataBase.EXPENSE_DESC],
        expTime: map[AppDataBase.EXPENSE_TIME],
        expAMT: map[AppDataBase.EXPENSE_AMT],
        expBal: map[AppDataBase.EXPENSE_BALANCE],
        expType: map[AppDataBase.EXPENSE_TYPE],
        expCatType: map[AppDataBase.EXPENSE_CATOGARY_TYPE]);
  }

  Map<String, dynamic> toMap() {
    return {
      AppDataBase.USER_ID: UID,
      AppDataBase.EXPENSE_TITLE: expTitle,
      AppDataBase.EXPENSE_DESC: expDesc,
      AppDataBase.EXPENSE_TIME: expTime,
      AppDataBase.EXPENSE_AMT: expAMT,
      AppDataBase.EXPENSE_BALANCE: expBal,
      AppDataBase.EXPENSE_TYPE: expType,
      AppDataBase.EXPENSE_CATOGARY_TYPE: expCatType,
    };
  }
}
