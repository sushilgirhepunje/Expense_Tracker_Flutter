import 'package:flutter/material.dart';
import 'package:modernlogintute/components/expense_tile.dart';
import 'package:modernlogintute/database/data/expense_data.dart';
import 'package:modernlogintute/database/models/expense_item.dart';
import 'package:provider/provider.dart';

import '../../components/expense_weektotal.dart';

class MyTransaction extends StatefulWidget {
  const MyTransaction({super.key});

  @override
  State<MyTransaction> createState() => _MyTransactionState();
}

class _MyTransactionState extends State<MyTransaction> {
  // text controller
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //prepare data
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  // add new expense
  void addNewExpense() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Add New Expense'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // expense name
                  TextField(
                    controller: newExpenseNameController,
                    decoration: const InputDecoration(hintText: 'Expense Name'),
                  ),

                  // expense amount
                  TextField(
                    controller: newExpenseAmountController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(hintText: 'Expense Amount'),
                  ),
                ],
              ),
              actions: [
                //save button
                MaterialButton(onPressed: save, child: Text('Save')),
                // cancel button
                MaterialButton(onPressed: cancel, child: Text('Cancel')),
              ],
            ));
  }

  // delete expense
  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  void save() {
    //create expense item
    ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now());

    // add the new expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  //clear controllers
  void clear() {
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey.shade50,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: addNewExpense,
                    child: Icon(
                      Icons.add,
                    ),
                    backgroundColor: const Color.fromRGBO(42, 48, 81, 1),
                  ),
                ),
              ],
            ),
            body: ListView(
              children: [
                // SizedBox(
                //   height: 50,
                // ),
                // weeks total
                MyExpenseWeekTotal(startOfWeek: value.startOfWeekDate()),

                //daily Transactions
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Daily Transactions',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                // expense list
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.getAllExpenseList().length,
                    itemBuilder: (context, index) => ExpenseTile(
                          name: value.getAllExpenseList()[index].name,
                          amount: value.getAllExpenseList()[index].amount,
                          dateTime: value.getAllExpenseList()[index].dateTime,
                          deleteTapped: (p0) =>
                              deleteExpense(value.getAllExpenseList()[index]),
                        )),
              ],
            )));
  }
}
