import 'package:flutter/material.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({
    super.key,
  });

  @override
  ThemeToggleState createState() {
    return ThemeToggleState();
  }
}

class ThemeToggleState extends State<ThemeToggle> {
  final isSelected = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(20.0),
        child: ToggleButtons(
          color: Colors.black.withOpacity(0.60),
          selectedColor: Colors.blue,
          selectedBorderColor: Colors.blue,
          fillColor: Colors.blue.withOpacity(0.08),
          splashColor: Colors.blue.withOpacity(0.12),
          hoverColor: Colors.blue.withOpacity(0.04),
          borderRadius: BorderRadius.circular(4.0),
          isSelected: isSelected,
          highlightColor: Colors.transparent,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = i == index;
              }
            });
          },
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('NIMBUS'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('EGGSHELL'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('OFF-WHITE'),
            ),
          ],
        ),
      );
}
