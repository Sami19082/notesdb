import 'package:expenseapp_bloc/Models/expense_models.dart';
import 'package:expenseapp_bloc/app_constants/content_constants.dart';
import 'package:expenseapp_bloc/custom_widgets/elevated_botton.dart';
import 'package:expenseapp_bloc/custom_widgets/textfield.dart';
import 'package:expenseapp_bloc/expanse_bloc/exp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  var titleController = TextEditingController();

  var descController = TextEditingController();

  var amtcontroller = TextEditingController();

  var transactionType = ["Debit", "Credit"];

  var selectedTransectionType = "Debit";

  DateTime expenseDate = DateTime.now();

  //for default date
  String elevatedbtnName = "Choose Date";
  var selectedCatIndex = -1;

  Future<void> _selctedDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 2, 15),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      setState(() {
        expenseDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 21,
              ),
              CstmTextField(
                lable: "Name your expense",
                iconData: Icons.abc,
                keyboardType: TextInputType.text,
                controller: titleController,
              ),
              CstmTextField(
                lable: "Add Description",
                iconData: Icons.abc,
                keyboardType: TextInputType.text,
                controller: descController,
              ),
              CstmTextField(
                lable: "Enter Amount",
                iconData: Icons.abc,
                keyboardType: TextInputType.number,
                controller: amtcontroller,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton(
                          value: selectedTransectionType,
                          items: transactionType
                              .map((type) =>
                              DropdownMenuItem(
                                  value: type, child: Text(type)))
                              .toList(),
                          onChanged: (value) {
                            selectedTransectionType = value!;
                            setState(() {});
                          }),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    CstmButton(
                        name: "Choose Expense",
                        btnColor: Colors.white,
                        textcolor: Colors.black,
                        mWidget: selectedCatIndex != -1
                            ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppConstants.mCategories[selectedCatIndex]
                                  .catImagePath,
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              " - ${AppConstants.mCategories[selectedCatIndex]
                                  .catTitle}",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                            : null,
                        onTap: () {
                          showBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15)),
                              ),
                              context: context,
                              builder: (context) {
                                return GridView.builder(
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4),
                                    itemBuilder: (context, index) {
                                      var eachCat =
                                      AppConstants.mCategories[index];
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedCatIndex = index;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.cyan.shade100,
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12),
                                            child:
                                            Image.asset(eachCat.catImagePath),
                                          ),
                                        ),
                                      );
                                    });
                              });
                        })
                  ],
                ),
              ),
              CstmButton(
                  name: DateFormat.yMMMd().format(expenseDate),
                  btnColor: Colors.white,
                  textcolor: Colors.purple,
                  onTap: () {
                    _selctedDate(context);
                  }),
              CstmButton(
                  name: "Add Expense",
                  btnColor: Colors.black,
                  textcolor: Colors.white,
                  onTap: () {
                    print(amtcontroller.text.toString());

                    var newexpense = ExpenseModel(
                        expID: 0,
                        UID: 0,
                        expTitle: titleController.text.toString(),
                        expDesc: descController.text.toString(),
                        expTime: expenseDate.microsecondsSinceEpoch.toString(),
                        expAMT: int.parse(amtcontroller.text.toString()),
                        expBal: 0,
                        expType: selectedTransectionType == "Debit" ? 0 : 1,
                        expCatType: selectedCatIndex);
                    BlocProvider.of<ExpBloc>(context).add(AddExpenseEvent(newExpense: newexpense));
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
