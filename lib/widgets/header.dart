import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: Text(title,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      );
}
