import 'package:expenseapp_bloc/app_constants/content_constants.dart';
import 'package:expenseapp_bloc/datetimeutils/datetimeutils.dart';
import 'package:expenseapp_bloc/expanse_bloc/exp_bloc.dart';
import 'package:expenseapp_bloc/onboarding/login.dart';
import 'package:expenseapp_bloc/screens/add_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/expense_models.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double mWidth = 0.0;
  double mHeight = 0.0;
  MediaQueryData? mq;
  num lastBalance = 0.0;

  @override
  void initState() {
    super.initState();
   BlocProvider.of<ExpBloc>(context as BuildContext).add(FetchAllExpEvent());
  }

  @override
  Widget build(BuildContext context) {
    getWidthheight();
    var isDark = Theme.of(context).brightness == Brightness.dark;
    var mq = MediaQuery.of(context);
    var mwidth = mq.size.width;
    var mheight = mq.size.height;
    print("Width : $mwidth,Height : $mheight");
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Application"),
      ),
      backgroundColor: Colors.grey.shade400,
      drawer: Drawer(
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 21,
                ),
                TextButton.icon(
                    onPressed: () async {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                            return Loginscreen();
                          }));
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setBool(Loginscreen.LOGIN_PREFS_KEY, false);
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Log Out",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            )),
      ),
      body: BlocBuilder<ExpBloc, ExpState>(
        builder: (context, state) {
          if (state is ExpenseLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ExpenseErrorState) {
            return Center(
              child: Text(state.errormsg),
            );
          }
          if (state is ExpenseLoadedState) {
            var dateWiseExpenses = filterDayWiseExpense(state.mData);
            return mq.orientation == Orientation.landscape
                ? landscapeLay(dateWiseExpenses)
                : portraitLay(dateWiseExpenses);
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddExpenseScreen();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
Widget portraitLay(List<DateWiseExpenseModel> dateWiseExpenses) {
  return Column(
    children: [
      Expanded(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your Balance till now:'),
                Text(
                  '0.0',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: ListView.builder(
            itemCount: dateWiseExpenses.length,
            itemBuilder: (_, parentIndex) {
              var eachItem = dateWiseExpenses[parentIndex];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${eachItem.date}'),
                        Text('${eachItem.totalAmt}')
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: eachItem.allTransactions.length,
                        itemBuilder: (_, childIndex) {
                          var eachTrans =
                          eachItem.allTransactions[childIndex];
                          return ListTile(
                            leading: Image.asset(AppConstants
                                .mCategories[eachTrans.expCatType]
                                .catImagePath),
                            title: Text(eachTrans.expTitle),
                            subtitle: Text(eachTrans.expDesc),
                            trailing: Column(
                              children: [
                                Text(eachTrans.expAMT.toString()),

                                ///balance will be added here
                              ],
                            ),
                          );
                        })
                  ],
                ),
              );
            }),
      ),
    ],
  );
}
Widget landscapeLay(List<DateWiseExpenseModel> dateWiseExpense) {
  return Column(
    children: [
      Expanded(
          flex: 3,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your Balance Till Now"),
                  Text(
                    "0.0",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )),
      Expanded(
          flex: 2,
          child: ListView.builder(
              itemCount: dateWiseExpense.length,
              itemBuilder: (context, parentIndex) {
                var eachitem = dateWiseExpense[parentIndex];
                return Padding(
                  padding: EdgeInsets.all(0.8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${eachitem.date}"),
                          Text("${eachitem.totalAmt}"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      ListView.builder(
                          itemCount: dateWiseExpense.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, childIndex) {
                            var eachtrans =
                            eachitem.allTransactions[childIndex];
                            return ListTile(
                              leading: Image.asset(AppConstants
                                  .mCategories[eachtrans.expCatType]
                                  .catImagePath),
                              title: Text(eachtrans.expTitle),
                              subtitle: Text(eachtrans.expDesc),
                              trailing: Column(
                                children: [
                                  Text(eachtrans.expAMT.toString()),
                                  //balance will be added
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                );
              }))
    ],
  );
}

List<DateWiseExpenseModel> filterDayWiseExpense(
    List<ExpenseModel> allExpenses) {
  List<DateWiseExpenseModel> dateWiseExpense = [];
  var listUniqueDates = [];
  for (ExpenseModel eachExp in allExpenses) {
    var mDate = DateTimeUtils.getFormattedDateMilli(int.parse(eachExp.expTime));
    if (!listUniqueDates.contains(mDate)) {
      listUniqueDates.add(mDate);
    }
  }
  for (String date in listUniqueDates) {
    List<ExpenseModel> eachDateExp = [];
    var totalAmt = 0.0;
    for (ExpenseModel eachExp in allExpenses) {
      var mDate =
      DateTimeUtils.getFormattedDateMilli(int.parse(eachExp.expTime));
      if (date == mDate) {
        eachDateExp.add(eachExp);
      } else {
        totalAmt += eachExp.expAMT;
      }
    }
    var formattedTodayDate =
    DateTimeUtils.getFormattedDateFromDateTime(DateTime.now());
    if (formattedTodayDate == date) {
      date = "Today";
    }
    var formattedYesterdayDate = DateTimeUtils.getFormattedDateFromDateTime(
        DateTime.now().subtract(Duration(days: 1)));
    if (formattedYesterdayDate == date) {
      date = "Yesterday";
    }
    dateWiseExpense.add(DateWiseExpenseModel(
        date: date,
        totalAmt: totalAmt.toString(),
        allTransactions: eachDateExp));
  }
  return dateWiseExpense;
}
