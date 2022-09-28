import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const Button({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialButton(
        onPressed: onClicked,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      );
}
