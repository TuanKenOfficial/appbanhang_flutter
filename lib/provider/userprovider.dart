import 'package:appbanhang/model/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class UserProvider extends ChangeNotifier {
  final List<Users> _items = [];
  List<Users> get items => _items; // Provide a getter for the list

  Future<void> getUserData() async {
    // Get current user (optional, if needed)
    User? currentUser = FirebaseAuth.instance.currentUser;
    // Fetch data from Firestore (assuming a collection named 'users')
    QuerySnapshot<Map<String, dynamic>> userSnapShot =
    await FirebaseFirestore.instance.collection('users').get();

    // Process each document in the snapshot
    userSnapShot.docs.forEach((doc) {
      // Extract data from the document
      if(currentUser?.uid == doc.data()['uid']){
        Map<String, dynamic> userData = doc.data();

        // Create a Users object (assuming appropriate constructor)
        Users user = Users(
            userId: userData['uid'],
            name: userData['name'],
            image: userData['image'],
            email: userData['email'],
            password: userData['password'],
            phone: userData['phone'],
            isMale: userData['isMale'],
            accountstatus: userData['accountstatus'],
        address: userData['address']);

        // Add the user to the internal list
        _items.add(user);
      }

    });
    // Notify listeners about changes
    notifyListeners();
  }
  List<Users> get getUserList{
    return _items;
  }
  void signOut() {
    _items.clear();
    print(_items);
    notifyListeners();
  }
  // Additional methods to get specific user data (optional)
  String getNameData() {
    if (_items.isEmpty) {
      return ""; // Handle empty list case
    }
    return _items.fold("", (total, item) => item.name); // Get all names
  }
  String getImageData() {
    if (_items.isEmpty) {
      return ""; // Handle empty list case
    }
    return _items.fold("", (total, item) => item.image); // Get all names
  }
  String getUidData() {
    if (_items.isEmpty) {
      return ""; // Handle empty list case
    }
    return _items.fold("", (total, item) => item.userId); // Get all names
  }
  String getEmailData() {
    if (_items.isEmpty) {
      return ""; // Handle empty list case
    }
    return _items.fold("", (total, item) => item.email); // Get all emails
  }
  String getPhoneData() {
    if (_items.isEmpty) {
      return ""; // Handle empty list case
    }
    return _items.fold("", (total, item) => item.phone); // Get all emails
  }
  String getAddressData() {
    if (_items.isEmpty) {
      return ""; // Handle empty list case
    }
    return _items.fold("", (total, item) => item.address); // Get all names
  }
  String getIsMaleData () {
    if (_items.isEmpty) {
      return ""; // Handle empty list case
    }
    return _items.fold("", (total, item) => item.isMale); // Get all emails
  }
  String getAccountStatusData () {
    if (_items.isEmpty) {
      return ""; // Handle empty list case
    }
    return _items.fold("", (total, item) => item.accountstatus); // Get all emails
  }
}