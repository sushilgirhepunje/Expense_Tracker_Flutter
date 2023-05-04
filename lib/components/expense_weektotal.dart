import 'package:flutter/cupertino.dart';
import 'package:modernlogintute/database/data/expense_data.dart';
import 'package:provider/provider.dart';

import '../database/dateTime/date_time_helper.dart';

class MyExpenseWeekTotal extends StatelessWidget {
  final DateTime startOfWeek;
  const MyExpenseWeekTotal({super.key, required this.startOfWeek});
  // calculate the week total
  String calculateWeekTotal(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday) {
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];
    double total = 0;
    for (var i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    String sunday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    String monday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    String tuesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    String thursday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    String friday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
        builder: (context, value, child) => SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Weekly spent',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '₹' +
                          '${calculateWeekTotal(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday)}',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ));
  }
}

/*

Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    children: [
                      Text(
                        'Weekly Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                     
                    ],
                  ),
                ),*/ 
