import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modernlogintute/components/expense_weeklysummary.dart';
import 'package:modernlogintute/database/data/expense_data.dart';
import 'package:provider/provider.dart';

import '../../components/expense_tile.dart';
import '../../components/my_button.dart';

class MyAnalysis extends StatelessWidget {
  const MyAnalysis({super.key});

  void singUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  backgroundColor: const Color.fromRGBO(42, 48, 81, 1),
                  actions: [
                    IconButton(
                      onPressed: singUserOut,
                      icon: Icon(Icons.logout),
                    )
                  ]),
              body: ListView(
                children: [
                  // weekly summary

                  ExpenseSummary(startOfWeek: value.startOfWeekDate()),

                  SizedBox(
                    height: 50,
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
                                value.getAllExpenseList()[index],
                          )),
                  //
                ],
              ),
            ));
  }
}
