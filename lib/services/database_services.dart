import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // Reference for our collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  // Saving the userdata
  Future<void> savingUserData(String fullName, String email) async {
    try {
      await userCollection.doc(uid).set({
        "fullName": fullName,
        "email": email,
        "uid": uid,
      });
    } catch (error) {
      print("Error saving user data: $error");
      // You might want to throw an exception or handle the error in a way that makes sense for your application
    }
  }

  // Getting user data
  Future<QuerySnapshot> gettingUserData(String email) async {
    try {
      return await userCollection.where("email", isEqualTo: email).get();
    } catch (error) {
      print("Error getting user data: $error");
      // You might want to throw an exception or handle the error in a way that makes sense for your application
      rethrow;
    }
  }
}
