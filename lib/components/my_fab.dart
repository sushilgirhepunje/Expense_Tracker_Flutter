import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/navigation_pages/analysis_page.dart';
import 'package:modernlogintute/pages/navigation_pages/profile.dart';
import 'package:modernlogintute/pages/navigation_pages/transactions_page.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({super.key});

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  List pages = [
    MyTransaction(),
    MyAnalysis(),
    // MyProfile(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    // print(index);
    //Handle button tap
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: onTap,
        index: currentIndex,
        backgroundColor: Colors.white,
        color: const Color.fromRGBO(42, 48, 81, 1),
        animationDuration: Duration(milliseconds: 300),
        items: <Widget>[
          Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.assessment_rounded,
            size: 30,
            color: Colors.white,
          ),
          // Icon(
          //   Icons.settings,
          //   size: 30,
          //   color: Colors.white,
          // ),
        ],
        // letIndexChange:(index) => true,
      ),
      // body: Container(color: Colors.grey.shade300),
    );
  }
}
