import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // reference for our collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');
  final CollectionReference expenseCollection =
      FirebaseFirestore.instance.collection('items');

  Future savingUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "email": email,
      'fullName': fullName,
      "items": [],
      "uid": uid,
    });
  }

  // getting user data
  Future gettingUserData(String email, String fullName) async {
    QuerySnapshot snapshot = await userCollection
        .where(
          "email",
          isEqualTo: email,
        )
        .get();
    return snapshot;
  }

  Future savingExpenseData(String expenseName, int amount) async {
    return await expenseCollection.doc(uid).set({});
  }
}
