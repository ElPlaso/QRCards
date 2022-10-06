import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/providers/cardCreator_provider.dart';
import 'package:swen325_assignment_3/providers/query_provider.dart';
import 'package:swen325_assignment_3/widgets/google_sign_in.dart';
import 'package:swen325_assignment_3/widgets/navigate.dart';
import 'firebase_options.dart';
import 'package:swen325_assignment_3/providers/card_provider.dart';
import 'package:swen325_assignment_3/providers/user_provider.dart';

void main() async {
  //debugPaintSizeEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//   FirebaseAuth.instance.authStateChanges().listen((User? user) {
//     if (user == null) {
//       print('User is currently signed out!');
//     } else {
//       print('User is signed in!');
//     }
//   });

  // ! idk just following tut
  FirebaseDatabase db = FirebaseDatabase.instance;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => QueryProvider()),
    ChangeNotifierProvider(create: (_) => CardCreator()),
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => Cards()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  static const String title = 'QRCards';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primaryColor: Colors.blue),
        initialRoute: '/eval', // could make a auth check here
        routes: Navigate.routes,
        // home: const Login(),
      ));
}
