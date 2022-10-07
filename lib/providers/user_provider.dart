import 'package:flutter/material.dart';

/// holders the user ID for query and database purposes
///
class UserProvider with ChangeNotifier {
  String userID = '';
  String get getUserID => userID;
  void setUserId(String? uid) {
    if (uid == null) {
      userID = '';
    } else {
      userID = uid;
    }
  }
}
