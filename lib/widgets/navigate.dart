import 'package:flutter/widgets.dart';
import 'package:swen325_assignment_3/pages/home.dart';
import 'package:swen325_assignment_3/pages/login.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/home': (context) => Home(),
    '/login': (context) => Login(),
  };
}
