import 'package:hive/hive.dart';

import '../models/expense_item.dart';

class HiveDataBase {
  // reference our box
  final myBox = Hive.box("expense_database");

  // writing data
  void saveData(List<ExpenseItem> allExpense) {
    /*
    Hive can only store strings and dateTime and not custom objects like expenseItems
    So lets convert expenseItem objects into type that can be stored in our db

    allExpense =
    */
    List<List<dynamic>> allExpensesFormatted = [];

    for (var expense in allExpense) {
      //convert each expenseItem into a list of storable types
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormatted.add(expenseFormatted);
    }

    //finally lets store in our database!
    myBox.put("ALL EXPENSES", allExpensesFormatted);
  }

  // read data
  List<ExpenseItem> readData() {
    /*
        Data is stored in hive as a list of strings + dateTime 
        so lets convert our saved data into expenseItem objects 
        savedData = [
          [name,amount,dateTime],
        ]
         */
    List savedExpenses = myBox.get("ALL EXPENSES") ?? [];
    List<ExpenseItem> allExpenses = [];

    for (var i = 0; i < savedExpenses.length; i++) {
      // collect individual expense data
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      // create expense item
      ExpenseItem expense = ExpenseItem(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );

      //add expense to overall list of expenses
      allExpenses.add(expense);
    }
    return allExpenses;
  }
}
