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
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 230, 230, 230)),
              foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(125, 0, 0, 0))),
          onPressed: onClicked,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ));
}
