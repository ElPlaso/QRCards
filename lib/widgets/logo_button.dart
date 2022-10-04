import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Icon icon;

  const LogoButton({
    required this.text,
    required this.onClicked,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: 300,
        height: 70,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: onClicked,
            label: Text(
              text,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            icon: icon,
          ),
        ),
      ));
}
