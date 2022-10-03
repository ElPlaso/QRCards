import 'package:flutter/material.dart';
// import 'package:font';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.all(32),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          child: Text('Sign up with Google'),
          onPressed: () {},
        )
      ]));
}
