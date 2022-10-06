import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/pages/display.dart';
import 'package:swen325_assignment_3/widgets/card_stack.dart';
import 'addCard.dart';
import '../main.dart';
import '../widgets/button.dart';
import '../widgets/wallet_wheel.dart';
import '../widgets/floater.dart';
import '../widgets/header.dart';

class UserCards extends StatelessWidget {
  const UserCards({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Your Cards'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 24),
              const CardStack(),
              Floater(
                  text: 'Add Card',
                  onClicked: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddCard()),
                      ),
                  icon: Icon(Icons.add))
            ],
          ),
        ),
      );
}
