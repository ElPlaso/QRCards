import 'package:flutter/material.dart';

class Floater extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const Floater({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        onPressed: onClicked,
        icon: Icon(Icons.add),
        label: Text(text),
      ));
}
