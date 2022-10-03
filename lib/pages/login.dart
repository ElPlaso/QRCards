import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/widgets/sign_up_widget.dart';
import '../main.dart';
import 'scan.dart';
import 'userCards.dart';
import 'wallet.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Header(title: 'Login'),
              SignUpWidget()
            ],
          ),
        ),
      );
}
