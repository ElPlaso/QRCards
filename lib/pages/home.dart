import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:swen325_assignment_3/providers/card_provider.dart';
import 'package:swen325_assignment_3/providers/query_provider.dart';
import '../main.dart';
import '../widgets/banner.dart';
import 'scan.dart';
import 'user_cards.dart';
import 'wallet.dart';
import '../widgets/logo_button.dart';
import '../widgets/carousel.dart';

// * Homepage that users are redirected to when logged in
// * Displays a welcome banner or user's cards if they exist
// * Provides navigation to other pages

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<QueryProvider>().updatePersonalcards(context);
    context.read<QueryProvider>().updateWallet(context);
  }

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
              context.watch<Cards>().isEmpty(true)
                  ? const HomeBanner(subheading: 'Add a card to get started :)')
                  : Carousel(),
              LogoButton(
                text: 'Scan',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Scan()),
                ),
                icon: const Icon(Icons.qr_code_scanner, size: 40),
              ),
              LogoButton(
                text: 'Create',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserCards()),
                ),
                icon: const Icon(Icons.library_add, size: 40),
              ),
              LogoButton(
                text: 'View Wallet',
                onClicked: () => {
                  if (context.read<Cards>().isEmpty(false))
                    {
                      Fluttertoast.showToast(
                          msg:
                              "No saved cards. Scan a card to add it to your list!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0)
                    }
                  else
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Wallet()),
                      )
                    }
                },
                icon: const Icon(Icons.wallet, size: 40),
              ),
            ],
          ),
        ),
      );
}
