import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/pages/home.dart';
import 'package:swen325_assignment_3/pages/login.dart';
import '../main.dart';
import 'scan.dart';
import 'userCards.dart';
import 'wallet.dart';
import '../widgets/button.dart';
import '../widgets/header.dart';
import 'package:swen325_assignment_3/providers/user_provider.dart';

class Eval extends StatefulWidget {
  const Eval({super.key});

  @override
  _EvalState createState() => _EvalState();
}

class _EvalState extends State<Eval> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => Scaffold(
      key: scaffoldKey,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('waiting');
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('something went wrong'),
              );
            } else if (snapshot.hasData) {
              print('user ${snapshot.data?.uid}');
              context.read<UserProvider>().setUserId(snapshot.data!.uid);
              return Home();
            } else {
              print('oh no');
              context.read<UserProvider>().setUserId('');
              return Login();
            }
          }));
}
