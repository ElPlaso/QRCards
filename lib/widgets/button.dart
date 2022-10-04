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
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: onClicked,
          child: Text(
            text,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ));
}
