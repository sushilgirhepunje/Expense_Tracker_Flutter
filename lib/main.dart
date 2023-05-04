import 'package:flutter/material.dart';
// import 'pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:modernlogintute/database/data/expense_data.dart';
import 'package:modernlogintute/pages/auth_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
// import 'components/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // initialize to hive
  await Hive.initFlutter();

  // open a hiv box
  await Hive.openBox("expense_database");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ExpenseData(),
        builder: (context, child) => const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: AuthPage(),
            ));
  }
}
