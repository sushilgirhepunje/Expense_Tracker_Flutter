import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  void singUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(42, 48, 81, 1),
        title: Text('Konsten'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text('Header'),
              MyButton(onTap: singUserOut, text: 'LogOut'),
            ],
          ),
        ),
      ),
    );
  }
}
