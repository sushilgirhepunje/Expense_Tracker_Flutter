import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "Sushil";
    final double date = 27;
    var day = "Tuesday";

    return Scaffold(
      appBar: AppBar(
        title: Text("Kosten"),
      ),
      body: Center(
        child: Container(
          child: Text(
              "Start $days days of flutter with $name with Date : $date and Day : $day"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
