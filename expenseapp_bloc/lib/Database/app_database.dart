import 'package:expenseapp_bloc/Models/expense_models.dart';
import 'package:expenseapp_bloc/Models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {
  AppDataBase._();

  static final AppDataBase instance = AppDataBase._();

  Database? mydb;

  //login
  static final String LOGIN_KEY_PREFS = "userlogin";
  //table
  static final String EXPENSE_TABLE = "expense";
  static final String USER_TABLE = "users";

//user column
  static final String USER_ID = "uid";
  static final String USER_NAME = "uname";
  static final String USER_MAIL = 'email';
  static final String USER_PASS = "pass";

//Expense Column
//add uid here also
  static final String EXPENSE_ID = "expID";
  static final String EXPENSE_TITLE = "expTitle";
  static final String EXPENSE_DESC = "expDesc";
  static final String EXPENSE_TIME = "expTIme";
  static final String EXPENSE_AMT = "expAMT";
  static final String EXPENSE_BALANCE = "expBal";
  static final String EXPENSE_TYPE = "expType"; // 0 for debit and 1 for credit
  static final String EXPENSE_CATOGARY_TYPE = "expCatog";

  Future<Database> initDB() async {
    var docDirectory = await getApplicationDocumentsDirectory();
    var pathdb = join(docDirectory.path, "expense.db");
    return await openDatabase(pathdb, version: 1, onCreate: (db, version) {
      //User table
      db.execute(
          "Create table $USER_TABLE ( $USER_ID integer primary key autoincrement, $USER_MAIL text, $USER_PASS text, $USER_NAME text)");
      //Expense table
      db.execute(
          "Create table $EXPENSE_TABLE ( $EXPENSE_ID integer primary key autoincrement, $EXPENSE_ID integer, $EXPENSE_TITLE text, $EXPENSE_DESC text, $EXPENSE_TIME text, $EXPENSE_AMT real, $EXPENSE_BALANCE real, $EXPENSE_TYPE integer, $EXPENSE_CATOGARY_TYPE integer )");
    });
  }

  Future<Database> getDB() async {
    if (mydb != null) {
      return mydb!;
    } else {
      mydb = await initDB();
      return mydb!;
    }
  }

  Future<int> getUID()async{
    var prefs = await SharedPreferences.getInstance();
    var uid = prefs.getInt(AppDataBase.LOGIN_KEY_PREFS);
    return uid ?? 0;
  }

  Future<bool>createAccount(UserModel newUser)async{
    var check = await checkifexist(newUser.umail);
    if(!check){
      var db = await getDB();
      db.insert(USER_TABLE, newUser.toMap());
      return true;
    }else{
      return false;
    }
  }

  Future<bool>checkifexist(String email)async{
    var db = await getDB();
    var data = await db.query(USER_TABLE,where: "$USER_MAIL = ? ", whereArgs: [email]);
    return data.isNotEmpty;
  }

  Future<bool> authenticateUser(String email, String pass)async{
    var db = await getDB();
    var data = await db.query(USER_TABLE,where: '$USER_MAIL = ? and $USER_PASS = ?',whereArgs: [email,pass]);
    if(data.isNotEmpty){
      var prefs = await SharedPreferences.getInstance();
      prefs.setInt(LOGIN_KEY_PREFS, UserModel.fromMap(data[0]).UID);
    }
    return data.isNotEmpty;
  }

  Future<bool> addExpense(ExpenseModel newExpense)async{
    var db = await getDB();
    int roweffected = await db.insert(EXPENSE_TABLE, newExpense.toMap());
    return roweffected>0;
  }

  Future<List<ExpenseModel>> fetchAllExpense()async{
    var db = await getDB();
    var data = await db.query(EXPENSE_TABLE);
   List<ExpenseModel> listExp = [];
   for(Map<String,dynamic> each in data){
     listExp.add(ExpenseModel.fromMap(each));
   }
   return listExp;
  }

}
