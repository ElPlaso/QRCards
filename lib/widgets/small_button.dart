import 'package:flutter/material.dart';

// * Smaller version of logo button
// * Requires button text and icon

class SmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Icon icon;

  const SmallButton({
    required this.text,
    required this.onClicked,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 15.0),
        child: SizedBox(
          width: 250,
          height: 50,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: OutlinedButton.icon(
              onPressed: onClicked,
              label: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
              ),
              icon: icon,
            ),
          ),
        ),
      );
}
