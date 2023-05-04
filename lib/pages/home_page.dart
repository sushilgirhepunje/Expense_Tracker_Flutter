import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  //sign out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(actions: [
            IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
          ]),
          body: Column(
            children: [
              Container(
                height: 50,
                child: Center(
                  child: Text('Total Balance Card'),
                ),
              ),
              Expanded(child: Container(
                color: Colors.purple.shade200,
                child: Center(
                  child: Text("Transactions"),
                ),
              )
            ),
            Container(
              height: 25,
              child: Text('Button'),
            )
            ],
          ),
          bottomNavigationBar: MyFloatingActionButton(),
        ),
    );
  }
}
